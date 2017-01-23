module CypressValidationUtility
  module Validate
    class CCNValidator
      include HealthDataStandards::Validate::BaseValidator
      include Singleton

      def initialize
        @name = 'CCN Validator'
      end

      def validate(file, options = {})
        document = get_document(file)
        errors = []
        ccn = document.at_xpath('/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/'\
                                "cda:id[@root='2.16.840.1.113883.4.336']/@extension")

        unless ccn
          errors << build_error('Test documents for EH submission must use a fixed CCN of 800890 when no hospital'\
                                'is associated with the document', '/', options[:file_name])
        end

        errors
      end
    end
  end
end
