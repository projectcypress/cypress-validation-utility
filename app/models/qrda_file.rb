require 'nokogiri'
require "ext/record"
require 'cat3_population_validator'
require 'measure_period_validator'
require 'ccn_validator'
require 'program_validator'

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
    @content = Nokogiri::XML(content_string) { |config| config.strict }
    @content.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    @content.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    @content
  end

  def process
    @measure_ids = get_measure_ids

    self.validation_errors = {}
    validators.each do |v|
      errs = v.validate(content, file_name: @filename)
      self.validation_errors[v.class.name] = errs.map { |e| e.instance_values }
      # the validation errors are their own class, for simplicity this turns it into just a hash
    end
  end

  def grouped_errors
    self.validation_errors
  end

  def errors
    self.validation_errors.values.flatten
  end

  def get_measure_ids
    measure_ids = content.xpath("//cda:entry/cda:organizer[./cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]" +
      "/cda:reference[@typeCode='REFR']/cda:externalDocument[@classCode='DOC']" +
      "/cda:id[@root='2.16.840.1.113883.4.738']/@extension").map(&:value).map(&:upcase)
    if !measure_ids
      return nil
    end
    measure_ids
  end

  private

  def program_type
    #Figure out if the program is EP or EH
    case program.upcase
    when "CPC","PQRS_MU_INDIVIDUAL","PQRS_MU_GROUP","MU_ONLY"
      "ep"
    when "HQR_EHR","HQR_IQR","HQR_EHR_IQR"
      "eh"
    else
      #If the program name doesn't exist, return nil
      "none"
    end
  end

  def cat1_validator
    @validators.concat CAT1_VALIDATORS
    if program_year == '2016'
      @validators << HealthDataStandards::Validate::DataValidator.new(BUNDLES['2016'], @measure_ids)
    end
    if program_type == "ep"
      if program_year == "2016"
        @validators << CypressValidationUtility::Validate::EPCat1_2016.instance
      end
    elsif program_type == "eh"
      if program_year == "2016"
        @validators << CypressValidationUtility::Validate::EHCat1_2016.instance
      end
    end
  end

  def validators
    return @validators if @validators
    @validators = []
    cms_validator = case doc_type

    when "cat1_r2"
      cat1_validator
      HealthDataStandards::Validate::Cat1R2
    when "cat1_r3"
      cat1_validator
      HealthDataStandards::Validate::Cat1
    when "cat3"
      @validators.concat CAT3_VALIDATORS
      @validators << CypressValidationUtility::Validate::Cat3PopulationValidator.instance
      if program_type == "ep"
        if program_year == "2016"
          CypressValidationUtility::Validate::EPCat3_2016
        end
      elsif program_type == "none"
        HealthDataStandards::Validate::Cat3
      else
        raise "Cannot validate an EH QRDA Category III file"
      end
    else
      raise "Invalid doc_type param: Must be one of (cat1, cat3)"
    end
    @validators << cms_validator.instance if cms_validator
    @validators << CypressValidationUtility::Validate::CCNValidator.instance if program.downcase == "eh"
    @validators << HealthDataStandards::Validate::CDA.instance
    @validators << CypressValidationUtility::Validate::MeasurePeriodValidator.new(program_type, program_year, doc_type)
    @validators << CypressValidationUtility::Validate::ProgramValidator.new(program) unless program == 'none'

    @validators
  end
end
