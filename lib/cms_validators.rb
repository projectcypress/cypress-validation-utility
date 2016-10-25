require_relative "./encounter_validator"

module CypressValidationUtility
  module Validate
    require 'health-data-standards'

    BASE_DIR = File.expand_path("../../", __FILE__)
    CMS_EP_CAT1_SCHEMATRON_2016 = 'resources/schematron/cat1/PQRS CMS 2016 QRDA Category I v2.3.sch'
    CMS_EH_CAT1_SCHEMATRON_2016 = 'resources/schematron/cat1/CMS 2016 QRDA Category 1 - HQR v2.3.sch'
    CMS_EH_CAT1_SCHEMATRON_2017 = 'resources/schematron/cat1/EH CMS 2017 QRDA Category I.sch'
    CMS_EP_CAT3_SCHEMATRON_2016 = 'resources/schematron/cat3/EP CMS 2016 QRDA Category III v2.2.sch'

    class EPCat1_2016 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super("CMS EP Cat I Schematron Validator", File.join(BASE_DIR, CMS_EP_CAT1_SCHEMATRON_2016))
      end
    end

    class EHCat1_2016 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super("CMS EH Cat I Schematron Validator", File.join(BASE_DIR, CMS_EH_CAT1_SCHEMATRON_2016))
      end

      def validate(file, options)
        errors = EncounterValidator.instance.validate(file,options)
        super(file,options) + errors
      end
    end

    class EHCat1_2017 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super("CMS EH Cat I Schematron Validator", File.join(BASE_DIR, CMS_EH_CAT1_SCHEMATRON_2017))
      end

      def validate(file, options)
        errors = EncounterValidator.instance.validate(file,options)
        super(file,options) + errors
      end
    end

    class EPCat3_2016 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super("CMS EP Cat III Schematron Validator", File.join(BASE_DIR, CMS_EP_CAT3_SCHEMATRON_2016))
      end
    end

  end
end
