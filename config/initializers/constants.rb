# frozen_string_literal: true

# Be sure to restart your server when you modify this file.
require 'logger'

require_relative '../../lib/cms_validators'
require_relative '../../lib/encounter_validator'

ERROR_LOG = Logger.new(::File.new('log/error.log', 'a+'))

POSSIBLE_BUNDLES = %w[2019].freeze
# just define which bundles we want for now, in the uploads controller we'll populate these
# (allows for re-checking without restarting in case the user installs a new one)

YEAR_PROGRAMS = {
  '2019' => {
    'eh' => [['Hospital Quality Reporting for the Promoting Interoperability Program', 'I', 'HQR_PI'],
             ['Hospital Quality Reporting for the Inpatient Quality Reporting Program', 'I', 'HQR_IQR'],
             ['Hospital Quality Reporting for the Promoting Interoperability Program and the Inpatient Quality Reporting Program', 'I', 'HQR_PI_IQR'],
             ['Hospital Quality Reporting for Inpatient Quality Reporting Program voluntary submissions', 'I', 'HQR_IQR_VOL']],
    'ep' => [['CPC+', 'III', 'CPCPLUS'],
             ['MIPS Individual', 'III', 'MIPS_INDIV'],
             ['MIPS Group', 'III', 'MIPS_GROUP'],
             ['MIPS Virtual Group', 'III', 'MIPS_VIRTUALGROUP']]
  }
}.freeze

YEAR_PROGRAMTYPE_DOCUMENTS = {
  '2019' => {
    'I' => [['QRDA Cat I (R5)', 'cat1_r5']],
    'III' => [['QRDA Cat III (R2.1)', 'cat3_r21']],
    'both' => [['QRDA Cat I (R5)', 'cat1_r5'], ['QRDA Cat III (R2.1)', 'cat3_r21']]
  }
}.freeze

CAT1_VALIDATORS = [HealthDataStandards::Validate::Cat1Measure.instance].freeze
CAT3_VALIDATORS = [HealthDataStandards::Validate::Cat3Measure.instance, HealthDataStandards::Validate::Cat3PerformanceRate.instance].freeze

VALIDATOR_NAMES = { 'HealthDataStandards::Validate::CDA' => 'CDA',
                    'HealthDataStandards::Validate::Cat1' => 'QRDA',
                    'HealthDataStandards::Validate::Cat1R2' => 'QRDA',
                    'HealthDataStandards::Validate::Cat3' => 'QRDA',
                    'HealthDataStandards::Validate::Cat3R11' => 'QRDA',
                    'CypressValidationUtility::Validate::EPCat3_2019' => 'CMS',
                    'CypressValidationUtility::Validate::EHCat1_20119' => 'CMS',
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
               10 => :doc_type,
               11 => :doc_frag,
               12 => :notaion }.freeze

BUNDLE_PERIOD_OVERRIDES = {
  '2018' => {
    'measure_period_start' => 1_546_300_800,
    'effective_date' => 1_577_836_799
  }
}.freeze

ZIP_FILE_LIMIT = 100
FILE_SIZE_LIMIT = 20_971_520 # bytes (20 MB)
