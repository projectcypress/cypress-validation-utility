# Be sure to restart your server when you modify this file.
require 'logger'

require_relative '../../lib/cms_validators'
require_relative '../../lib/encounter_validator'

ERROR_LOG = Logger.new(::File.new('log/error.log', 'a+'))

POSSIBLE_BUNDLES = %w(2016 2017 2018).freeze
# just define which bundles we want for now, in the uploads controller we'll populate these
# (allows for re-checking without restarting in case the user installs a new one)

YEAR_PROGRAMS = {
  '2016' => {
    'eh' => [['Hospital Quality Reporting for the EHR Incentive Program', 'I', 'HQR_EHR'],
             ['Hospital Quality Reporting for the EHR Incentive Program and the IQR Program', 'I', 'HQR_EHR_IQR'],
             ['Hospital Quality Reporting for the Inpatient Quality Reporting Program', 'I', 'HQR_IQR']],
    'ep' => [['Comprehensive End-Stage Renal Disease Care Initiative', 'III', 'CEC'],
             ['PQRS Meaningful Use Individual', 'both', 'PQRS_MU_INDIVIDUAL'],
             ['PQRS Meaningful Use Group', 'both', 'PQRS_MU_GROUP'],
             %w(CPC III CPC),
             ['Meaningful Use Only', 'III', 'MU_ONLY']]
  },
  '2017' => {
    'eh' => [['Hospital Quality Reporting for the EHR Incentive Program', 'I', 'HQR_EHR'],
             ['Hospital Quality Reporting for the EHR Incentive Program and the IQR Program', 'I', 'HQR_EHR_IQR'],
             ['Hospital Quality Reporting for the Inpatient Quality Reporting Program', 'I', 'HQR_IQR']],
    'ep' => [['CPC+', 'III', 'CPCPLUS'],
             ['MIPS Individual', 'III', 'MIPS_INDIV'],
             ['MIPS Group', 'III', 'MIPS_GROUP']]
  },
  '2018' => {
    'eh' => [['Hospital Quality Reporting for the EHR Incentive Program', 'I', 'HQR_EHR'],
             ['Hospital Quality Reporting for the EHR Incentive Program and the IQR Program', 'I', 'HQR_EHR_IQR'],
             ['Hospital Quality Reporting for the Inpatient Quality Reporting Program', 'I', 'HQR_IQR'],
             ['Hospital Quality Reporting for Inpatient Quality Reporting Program voluntary submissions', 'I', 'HQR_IQR_VOL'],
             ['Hospital Quality Reporting for Episode Payment Model voluntary submissions', 'I', 'HQR_EPM_VOL']],
    'ep' => []
  }
}.freeze

YEAR_PROGRAMTYPE_DOCUMENTS = {
  '2016' => {
    'I' => [['QRDA Cat I (R3)', 'cat1_r3']],
    'III' => [['QRDA Cat III (R1)', 'cat3_r1']],
    'both' => [['QRDA Cat I (R3)', 'cat1_r3'], ['QRDA Cat III (R1)', 'cat3_r1']]
  },
  '2017' => {
    'I' => [['QRDA Cat I (R3.1)', 'cat1_r31']],
    'III' => [['QRDA Cat III (R2.1)', 'cat3_r21']],
    'both' => [['QRDA Cat I (R3.1)', 'cat1_r31'], ['QRDA Cat III (R2.1)', 'cat3_r21']]
  },
  '2018' => {
    'I' => [['QRDA Cat I (R4)', 'cat1_r4']],
    'III' => [['QRDA Cat III (R2.1)', 'cat3_r21']],
    'both' => [['QRDA Cat I (R4)', 'cat1_r4'], ['QRDA Cat III (R2.1)', 'cat3_r21']]
  }
}.freeze

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
  '2015' => {
    'measure_period_start' => 1_451_606_400,
    'effective_date' => 1_483_228_799
  },
  '2016' => {
    'measure_period_start' => 1_483_228_800,
    'effective_date' => 1_514_764_799
  },
  '2017' => {
    'measure_period_start' => 1_514_851_200,
    'effective_date' => 1_546_300_799
  }
}.freeze
