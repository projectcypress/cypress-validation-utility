# Be sure to restart your server when you modify this file.
require 'logger'

require_relative '../../lib/cms_validators'
require_relative '../../lib/encounter_validator'

ERROR_LOG = Logger.new(::File.new('log/error.log', 'a+'))

BUNDLES = { '2016' => nil, '2017' => nil }.freeze
# just define which bundles we want for now, in the uploads controller we'll populate these
# (allows for re-checking without restarting in case the user installs a new one)

CAT1_VALIDATORS = [HealthDataStandards::Validate::Cat1Measure.instance].freeze
CAT3_VALIDATORS = [HealthDataStandards::Validate::Cat3Measure.instance, HealthDataStandards::Validate::Cat3PerformanceRate.instance].freeze

VALIDATOR_NAMES = { 'HealthDataStandards::Validate::CDA' => 'CDA',
                    'HealthDataStandards::Validate::Cat1' => 'QRDA',
                    'HealthDataStandards::Validate::Cat1R2' => 'QRDA',
                    'HealthDataStandards::Validate::Cat3' => 'QRDA',
                    'HealthDataStandards::Validate::Cat3R11' => 'QRDA',
                    'CypressValidationUtility::Validate::EPCat1_2016' => 'CMS',
                    'CypressValidationUtility::Validate::EPCat3_2016' => 'CMS',
                    'CypressValidationUtility::Validate::EHCat1_2016' => 'CMS',
                    'HealthDataStandards::Validate::DataValidator' => 'Value Sets',
                    'HealthDataStandards::Validate::Cat1Measure' => 'Measures',
                    'HealthDataStandards::Validate::Cat3Measure' => 'Measures',
                    'HealthDataStandards::Validate::Cat3PerformanceRate' => 'Performance Rate',
                    'CypressValidationUtility::Validate::Cat3PopulationValidator' => 'Populations',
                    'CypressValidationUtility::Validate::ValuesetCategoryValidator' => 'Valueset Category',
                    'CypressValidationUtility::Validate::CCNValidator' => 'Reporting',
                    'CypressValidationUtility::Validate::ProgramValidator' => 'CMS Program',
                    'CypressValidationUtility::Validate::MeasurePeriodValidator' => 'Measure Period' }.freeze

VALIDATOR_CATEGORIES = { qrda: 'QRDA Errors', reporting: 'Reporting Errors', submission: 'Submission Errors', warning: 'Warnings' }.freeze

NODE_TYPES = { 1 => :element,
               2 => :attribute,
               3 => :text,
               4 => :cdata,
               5 => :ent_ref,
               6 => :entity,
               7 => :instruction,
               8 => :comment,
               9 => :document,
               10  => :doc_type,
               11  => :doc_frag,
               12  => :notaion }.freeze

BUNDLE_PERIOD_OVERRIDES = {
  '2015.0.0' => {
    'measure_period_start' => 1_451_606_400,
    'effective_date' => 1_483_228_799
  },
  '2016.0.0' => {
    'measure_period_start' => 1_483_228_800,
    'effective_date' => 1_514_764_799
  }
}.freeze
