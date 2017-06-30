require 'nokogiri'
require 'ext/record'
require 'cat3_population_validator'
require 'measure_period_validator'
require 'ccn_validator'
require 'program_validator'
require 'valueset_category_validator'

class QrdaFile
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :upload, index: true
  has_one :record

  field :doc_type, type: String
  field :program, type: String
  field :program_year, type: String

  field :content_string, type: String
  field :filename, type: String
  field :validation_errors, type: Hash

  def content
    return @content if @content
    @content = Nokogiri::XML(content_string, &:strict)
    @content.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    @content.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    @content
  end

  def process
    @measure_ids = measure_ids_from_file

    @bundle = BUNDLES[program_year]

    self.validation_errors = { qrda: [], reporting: [], submission: [], warning: [], ungrouped: [] }
    validators.each do |v|
      errs = v.validate(content, file_name: @filename)
      errs.each do |e|
        e.validator ||= v.class.name
        # make cat1 validation error types a warning for data criteria outside the measure definition
        if (e.validator == 'HealthDataStandards::Validate::DataValidator') && (e.message.include? 'data criteria outside')
          validation_errors[:warning] << e.instance_values
        else
          validation_errors[validator_category(e.validator)] << e.instance_values
        end
        # the validation errors are their own class, e.instance_values turns it into just a hash for simplicity
      end
    end

    # if we forget to group something we will have a tab for it, otherwise dont show that tab
    validation_errors.delete(:ungrouped) if validation_errors[:ungrouped].empty?
  end

  def grouped_errors
    validation_errors
  end

  def errors
    validation_errors.values.flatten
  end

  def measure_ids_from_file
    measure_ids = content.xpath("//cda:entry/cda:organizer[./cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]" \
      "/cda:reference[@typeCode='REFR']/cda:externalDocument[@classCode='DOC']" \
      "/cda:id[@root='2.16.840.1.113883.4.738']/@extension").map(&:value).map(&:upcase)
    return nil unless measure_ids
    measure_ids
  end

  private

  def validator_category(validator)
    case validator
    when 'CDA SDTC Validator', 'QRDA Cat 1 R3 Validator', 'QRDA Cat 1 Validator', 'QRDA Cat 3 Validator',
         'CMS EP Cat I Schematron Validator', 'CMS EH Cat I Schematron Validator', 'CMS EP Cat III Schematron Validator',
         'QRDA QDM Template Validator', 'CMS EC Cat III Schematron Validator'
      :qrda
    when 'Cat 1 Measure ID Validator', 'HealthDataStandards::Validate::Cat1Measure',
         'Cat 3 Measure ID Validator', 'HealthDataStandards::Validate::Cat3Measure',
         'HealthDataStandards::Validate::Cat3PerformanceRate', 'Cat III Population Validator',
         'HealthDataStandards::Validate::DataValidator'
      :reporting
    when 'CCN Validator', 'Measure Period Validator', 'CMS Program Validator', 'Encounter validator',
         'Valueset Category Validator'
      :submission
    else
      :ungrouped
    end
  end

  def program_type
    # Figure out if the program is EP or EH
    case program.upcase
    when 'CPC', 'PQRS_MU_INDIVIDUAL', 'PQRS_MU_GROUP', 'MU_ONLY'
      'ep'
    when 'HQR_EHR', 'HQR_IQR', 'HQR_EHR_IQR'
      'eh'
    else
      # If the program name doesn't exist, return nil
      'none'
    end
  end

  def cat1_validator
    @validators.concat CAT1_VALIDATORS
    @validators << HealthDataStandards::Validate::DataValidator.new(@bundle, @measure_ids)
    @validators << CypressValidationUtility::Validate::ValuesetCategoryValidator.new(@measure_ids, @bundle.id)

    # QrdaQdmTemplateValidator only gets a different template version in 2017 measure year for EH
    qrda_qdm_template_type = 'r3'

    if program_type == 'ep'
      if program_year == '2016'
        @validators << CypressValidationUtility::Validate::EPCat1_2016.instance
      end
    elsif program_type == 'eh'
      case program_year
      when '2016'
        @validators << CypressValidationUtility::Validate::EHCat1_2016.instance
      when '2017'
        @validators << CypressValidationUtility::Validate::EHCat1_2017.instance
        qrda_qdm_template_type = 'r3_1'
      end
      @validators << HealthDataStandards::Validate::QrdaQdmTemplateValidator.new(qrda_qdm_template_type)
    end
  end

  def validators
    return @validators if @validators
    @validators = []
    cms_validator = cms_validator_for_doc_type
    @validators << cms_validator.instance if cms_validator
    @validators << CypressValidationUtility::Validate::CCNValidator.instance if program_type == 'eh'
    @validators << HealthDataStandards::Validate::CDA.instance
    @validators << CypressValidationUtility::Validate::ProgramValidator.new(program) unless program == 'none'
    @validators << CypressValidationUtility::Validate::MeasurePeriodValidator.new(program_type, program_year, doc_type)

    @validators
  end

  def cms_validator_for_doc_type
    case doc_type
    when 'cat1_r3'
      cat1_validator
      HealthDataStandards::Validate::Cat1
    when 'cat1_r31'
      cat1_validator
      HealthDataStandards::Validate::Cat1R31
    when 'cat3_r1', 'cat3_r2'
      cms_cat3_validator
    else
      raise 'Invalid doc_type param: Must be one of (cat1, cat3)'
    end
  end

  def cms_cat3_validator
    @validators.concat CAT3_VALIDATORS
    @validators << CypressValidationUtility::Validate::Cat3PopulationValidator.instance
    if program_type == 'ep' && program_year == '2016'
      CypressValidationUtility::Validate::EPCat3_2016
    elsif program_type == 'ep' && program_year == '2017'
      CypressValidationUtility::Validate::ECCat3_2017
    elsif program_type == 'none'
      if doc_type == 'cat3_r1'
        HealthDataStandards::Validate::Cat3
      elsif doc_type == 'cat3_r2'
        HealthDataStandards::Validate::Cat3R2
      end
    else
      raise 'Cannot validate an EH QRDA Category III file'
    end
  end
end
