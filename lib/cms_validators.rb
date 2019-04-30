# frozen_string_literal: true

require_relative './encounter_validator'

module CypressValidationUtility
  module Validate
    require 'health-data-standards'

    BASE_DIR = File.expand_path('..', __dir__)
    CMS_EH_CAT1_SCHEMATRON_2019 = 'resources/schematron/cat1/2019/EH CMS 2019 QRDA Category I.sch'
    CMS_EC_CAT3_SCHEMATRON_2019 = 'resources/schematron/cat3/2019/CMS 2019 QRDA Category III.sch'

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

    class ECCat3_2019 < HealthDataStandards::Validate::Schematron::Validator
      include Singleton

      def initialize
        super('CMS EC Cat III Schematron Validator', File.join(BASE_DIR, CMS_EC_CAT3_SCHEMATRON_2019))
      end
    end
  end
end
