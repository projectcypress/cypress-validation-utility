require 'nokogiri'

class Upload
  attr_reader :doc_type, :program, :program_year, :content, :filename

  def initialize(file, content_string, doc_type, program=nil, year)
    @filename = file
    @content = Nokogiri::XML(content_string) { |config| config.strict }
    @content.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    @content.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')

    #if the doc_type isn't passed in, see if we can find it in the document
    doc_type = get_doc_type if !doc_type
    @doc_type = doc_type

    #if the program isn't passed in, see if we can find it in the document
    program = get_program if !program
    @program = program

    measure_ids = get_measure_ids if !measure_ids
    @measure_ids = measure_ids

    @program_year = year
    @errors = validators.inject({}) do |errors, v|
      errors[v] = v.validate(@content, file_name: file)
      errors
    end
  end

  def grouped_errors
    @errors
  end

  def errors
    @errors.values.flatten
  end

  private

  def get_doc_type
    # check to see if there's a node with the templateId for a QRDA Cat I
    if @content.at_xpath("//xmlns:templateId[@root='2.16.840.1.113883.10.20.24.1.1']")
      return "cat1"
    #if it's not a cat1, check to see if there's a node with the templateId for a Cat 3
    elsif @content.at_xpath("//xmlns:templateId[@root='2.16.840.1.113883.10.20.27.1.1']")
      return "cat3"
    #if it's neither of these, something's probably wrong
    else
      raise "Document doesn't appear to be a QRDA Cat 1 or Cat 3"
    end
  end

  def get_program
    #xpath for informationRecipient, which is where CMS wants the code for the program
    prog = @content.at_xpath("//cda:informationRecipient/cda:intendedRecipient/cda:id/@extension")
    #If it's not there, raise an error
    if !prog
      return "none"
    end

    #Figure out if the program is EP or EH
    return case prog.value
    when "CPC","PQRS_MU_INDIVIDUAL","PQRS_MU_GROUP","MU_ONLY"
      "ep"
    when "HQR_EHR","HQR_IQR","HQR_EHR_IQR"
      "eh"
    else
      #If the program name doesn't exist, return nil
      "none"
    end
  end

  def get_measure_ids
    measure_ids = @content.xpath("//cda:entry/cda:organizer[./cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]" +
      "/cda:reference[@typeCode='REFR']/cda:externalDocument[@classCode='DOC']" +
      "/cda:id[@root='2.16.840.1.113883.4.738']/@extension").map(&:value).map(&:upcase)
    if !measure_ids
      return nil
    end
    measure_ids
  end

  def cat1_validator
    @validators.concat CAT1_VALIDATORS
    if @program_year == '2016'
      @validators << HealthDataStandards::Validate::DataValidator.new(BUNDLES['2016'], @measure_ids)
    end
    if @program.downcase == "ep"
      if @program_year == "2016"
        @validators << CypressValidationUtility::Validate::EPCat1_2016.instance
      end
    elsif @program.downcase == "eh"
      if @program_year == "2016"
        @validators << CypressValidationUtility::Validate::EHCat1_2016.instance
      end
    end
  end

  def validators
    return @validators if @validators
    @validators = []
    cms_validator = case @doc_type

    when "cat1_r2"
      cat1_validator
      HealthDataStandards::Validate::Cat1R2
    when "cat1_r3"
      cat1_validator
      HealthDataStandards::Validate::Cat1
    when "cat3"
      @validators.concat CAT3_VALIDATORS
      if @program.downcase == "ep"
        if @program_year == "2016"
          CypressValidationUtility::Validate::EPCat3_2016
        end
      elsif @program.downcase == "none"
        HealthDataStandards::Validate::Cat3
      else
        raise "Cannot validate an EH QRDA Category III file"
      end
    else
      raise "Invalid doc_type param: Must be one of (cat1, cat3)"
    end
    @validators << cms_validator.instance if cms_validator
    @validators << HealthDataStandards::Validate::CDA.instance
  end
end
