# frozen_string_literal: true

require_relative './encounter_validator'

module CypressValidationUtility
  module Validate
    require 'health-data-standards'

    BASE_DIR = File.expand_path('../../', __FILE__)
    CMS_EP_CAT1_SCHEMATRON_2016 = 'resources/schematron/cat1/2016/PQRS CMS QRDA Category I.sch'
    CMS_EH_CAT1_SCHEMATRON_2016 = 'resources/schematron/cat1/2016/HQR CMS QRDA Category I.sch'
    CMS_EH_CAT1_SCHEMATRON_2017 = 'resources/schematron/cat1/2017/EH CMS 2017 QRDA Category I.sch'
    CMS_EH_CAT1_SCHEMATRON_2018 = 'resources/schematron/cat1/2018/EH CMS 2018 QRDA Category I.sch'
    CMS_EH_CAT1_SCHEMATRON_2019 = 'resources/schematron/cat1/2019/EH CMS 2019 QRDA Category I.sch'
    CMS_EP_CAT3_SCHEMATRON_2016 = 'resources/schematron/cat3/2016/EP CMS 2016 QRDA Category III.sch'
    CMS_EC_CAT3_SCHEMATRON_2017 = 'resources/schematron/cat3/2017/EC CMS 2017 QRDA Category III.sch'
    CMS_EC_CAT3_SCHEMATRON_2018 = 'resources/schematron/cat3/2018/EC CMS 2018 QRDA Category III.sch'

    class EPCat1_2016 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EP Cat I Schematron Validator', File.join(BASE_DIR, CMS_EP_CAT1_SCHEMATRON_2016))
      end
    end

    class EHCat1_2016 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EH Cat I Schematron Validator', File.join(BASE_DIR, CMS_EH_CAT1_SCHEMATRON_2016))
      end

      def validate(file, options)
        errors = EncounterValidator.instance.validate(file, options)
        super(file, options) + errors
      end
    end

    class EHCat1_2017 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EH Cat I Schematron Validator', File.join(BASE_DIR, CMS_EH_CAT1_SCHEMATRON_2017))
      end

      def validate(file, options)
        errors = EncounterValidator.instance.validate(file, options)
        super(file, options) + errors
      end
    end

    class EHCat1_2018 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EH Cat I Schematron Validator', File.join(BASE_DIR, CMS_EH_CAT1_SCHEMATRON_2018))
      end

      def validate(file, options)
        errors = EncounterValidator.instance.validate(file, options)
        super(file, options) + errors
      end
    end

    class EHCat1_2019 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EH Cat I Schematron Validator', File.join(BASE_DIR, CMS_EH_CAT1_SCHEMATRON_2019))
      end

      def validate(file, options)
        errors = EncounterValidator.instance.validate(file, options)
        super(file, options) + errors
      end
    end

    class EPCat3_2016 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EP Cat III Schematron Validator', File.join(BASE_DIR, CMS_EP_CAT3_SCHEMATRON_2016))
      end
    end

    class ECCat3_2017 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EC Cat III Schematron Validator', File.join(BASE_DIR, CMS_EC_CAT3_SCHEMATRON_2017))
      end
    end

    class ECCat3_2018 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EC Cat III Schematron Validator', File.join(BASE_DIR, CMS_EC_CAT3_SCHEMATRON_2018))
      end
    end
  end
end
