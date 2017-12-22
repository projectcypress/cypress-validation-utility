# frozen_string_literal: true
require 'cypress/go_importer'

module Cypress
  class Cat3Calculator
    attr_accessor :correlation_id, :measure, :bundle, :mre, :qr

    def initialize(measure_ids, bundle, correlation_id)
      @correlation_id = correlation_id
      @measures = bundle.measures.in(hqmf_id: measure_ids)
      @bundle = bundle
    end

    # Generates the QRDA/CDA header, using the header info above
    def generate_header(provider = nil)
      cda_header = { identifier: { root: 'CypressRoot', extension: 'CypressExtension' },
                     authors:       [{ ids: [{ root: 'authorRoot', extension: 'authorExtension' }],
                                       device: { name: 'deviceName', model: 'deviceModel' },
                                       addresses: [], telecoms: [], time: nil,
                                       organization: { ids: [{ root: 'authorsOrganizationRoot', extension: 'authorsOrganizationExt' }], name: '' } }],
                     custodian: { ids: [{ root: 'custodianRoot', extension: 'custodianExt' }],
                                  person: { given: '', family: '' }, organization: { ids: [{ root: 'custodianOrganizationRoot',
                                                                                             extension: 'custodianOrganizationExt' }], name: '' } },
                     legal_authenticator: { ids: [{ root: 'legalAuthenticatorRoot', extension: 'legalAuthenticatorExt' }], addresses: [],
                                            telecoms: [], time: nil,
                                            person: { given: nil, family: nil },
                                            organization: { ids: [{ root: 'legalAuthenticatorOrgRoot', extension: 'legalAuthenticatorOrgExt' }],
                                                            name: '' } } }

      header = Qrda::Header.new(cda_header)

      header.identifier.root = UUID.generate
      header.authors.each { |a| a.time = Time.current }
      header.legal_authenticator.time = Time.current
      header.performers << provider

      header
    end

    def generate_oid_dictionary
      oids = @measures.pluck(:oids).flatten.uniq
      valuesets = @bundle.value_sets.in(oid: oids)
      js = {}
      valuesets.each do |vs|
        js[vs.oid] = cached_value(vs)
      end
      js.to_json
    end

    def cached_value(vs)
      @loaded_valuesets ||= {}
      return @loaded_valuesets[vs.oid] if @loaded_valuesets[vs.oid]
      js = {}
      vs.concepts.each do |con|
        name = con.code_system_name
        js[name] ||= []
        js[name] << con.code.downcase unless js[name].index(con.code.downcase)
      end
      @loaded_valuesets[vs.oid] = js
      js
    end

    def import_cat1_zip(zip)
      Zip::ZipFile.open(zip.path) do |zip_file|
        zip_file.entries.each do |entry|
          doc = zip_file.read(entry)
          import_cat1_file(doc)
        end
      end
    end

    def import_cat1_file(doc)
      record = GoCDATools::Import::GoImporter.instance.parse_with_ffi(doc)
      record.test_id = @correlation_id
      record.medical_record_number = rand(1_000_000_000_000_000)
      Cypress::GoImport.replace_negated_codes(record, @bundle)
      record.save
      exporter = HealthDataStandards::Export::HTML.new
      output = File.open('tmp/patient.html', 'w')
        output << exporter.export(record)
      output.close
      record
    rescue StandardError => e
      Rails.logger.error e.message.to_s
      nil
    end

    def generate_cat3
      ex_opts = { test_id: @correlation_id, effective_date: bundle.effective_date,
                  enable_logging: false, enable_rationale: true }

      oid_dictionary = generate_oid_dictionary
      @measures.each do |measure|
        qr = QME::QualityReport.find_or_create(measure.hqmf_id, measure.sub_id, ex_opts)
        qr.calculate({ 'prefilter' => { test_id: @correlation_id }, oid_dictionary: oid_dictionary, bundle_id: @bundle.id }, false)
      end
      # QRDA III export hardcoded to r2. Version doesn't matter, this is for displaying the calculation results only.
      exporter = HealthDataStandards::Export::Cat3.new('r2')
      end_date = Time.at(@bundle.effective_date.to_i).utc
      xml = exporter.export(@measures,
                            generate_header,
                            @bundle.effective_date.to_i,
                            end_date.years_ago(1) + 1,
                            end_date,
                            nil,
                            nil,
                            @correlation_id)
      # QME::PatientCache.where(test_id: @correlation_id).destroy_all
      HealthDataStandards::CQM::QueryCache.where(test_id: @correlation_id).destroy_all
      xml
    end
  end
end
