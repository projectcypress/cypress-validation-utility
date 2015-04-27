require_relative "./encounter_validator"

module CypressValidationUtility
  module Validate
    require 'health-data-standards'

    BASE_DIR = File.expand_path("../../", __FILE__)
    CMS_EP_CAT1_SCHEMATRON = 'resources/schematron/EP/QRDA_Category_I_pqrs.sch'
    CMS_EH_CAT1_SCHEMATRON = 'resources/schematron/EH/HRQRDACat1R2ValidationChecks.sch'
    CMS_EP_CAT3_SCHEMATRON = 'resources/schematron/EP/QRDA_Category_III_main.sch'

    class EPCat1 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super("CMS EP Cat I Schematron Validator", File.join(BASE_DIR, CMS_EP_CAT1_SCHEMATRON))
      end
    end

    class EHCat1 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super("CMS EH Cat I Schematron Validator", File.join(BASE_DIR, CMS_EH_CAT1_SCHEMATRON))
      end

      def validate(file, options)
        errors = EncounterValidator.instance.validate(file,options)
        super(file,options) + errors
      end
    end

    class EPCat3 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super("CMS EP Cat III Schematron Validator", File.join(BASE_DIR, CMS_EP_CAT3_SCHEMATRON))
      end
    end

  end
end
