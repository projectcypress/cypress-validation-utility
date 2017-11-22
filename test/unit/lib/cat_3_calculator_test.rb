require 'test_helper'
require 'fileutils'

class Cat3CalculatorTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  setup do
    unzip_if_necessary('measures')
    collection_fixtures('measures', 'bundles', 'health_data_standards_svs_value_sets',
                        'records', 'patient_cache')
    load_library_functions
    @bundle = HealthDataStandards::CQM::Bundle.find_by(:version.in => ['2.7.0'])
  end

  def test_import_cat1_file
    file = IO.read('test/fixtures/5_ASTHMA_A_with_errors.xml')
    before_count = Record.count
    correlation_id = BSON::ObjectId.from_string('59d23e07aeac50b1495d2583')
    c3c = Cypress::Cat3Calculator.new(['40280381-43DB-D64C-0144-64CB12982D97'], @bundle, correlation_id)
    c3c.import_cat1_file(file)
    assert_equal before_count + 1, Record.count
    assert_equal correlation_id, Record.order_by(created_at: 'asc').last.test_id
    cat3 = c3c.generate_cat3
    assert_not_equal 0, cat3.length
  end

  def test_import_cat1_file_twice_same_correlation
    file = IO.read('test/fixtures/5_ASTHMA_A_with_errors.xml')
    before_count = Record.count
    correlation_id = BSON::ObjectId.from_string('59d23e07aeac50b1495d2583')
    c3c = Cypress::Cat3Calculator.new(['40280381-43DB-D64C-0144-64CB12982D97'], @bundle, correlation_id)
    c3c.import_cat1_file(file)

    assert_equal before_count + 1, Record.count
    assert_equal correlation_id, Record.order_by(created_at: 'asc').last.test_id
    cat3 = c3c.generate_cat3
    assert_equal 1, QME::PatientCache.all.size

    cat3 = c3c.generate_cat3

    # There will still only be one record
    assert_equal before_count + 1, Record.count
    # There will now be 2 patient cache values for the same patient
    assert_equal 2, QME::PatientCache.all.size
    patient_cache = Mongoid.default_client['patient_cache']
    assert_raises do
      patient_cache.indexes.create_one({ 'value.measure_id' => 1, 'value.sub_id' => 1, 'value.effective_date' => 1, 'value.patient_id' => 1 },
                                       'unique' => true)
    end
    # Clean up database indexes prior to moving to next test
    patient_cache.drop
  end

  def test_import_cat1_file_twice_difference_correlation
    file = IO.read('test/fixtures/5_ASTHMA_A_with_errors.xml')
    before_count = Record.count
    correlation_id = BSON::ObjectId.from_string('59d23e07aeac50b1495d2583')
    c3c = Cypress::Cat3Calculator.new(['40280381-43DB-D64C-0144-64CB12982D97'], @bundle, correlation_id)
    c3c.import_cat1_file(file)
    # There is a single record
    assert_equal before_count + 1, Record.count
    cat3 = c3c.generate_cat3
    # There is a single patient cache value
    assert_equal 1, QME::PatientCache.all.size

    correlation_id_2 = BSON::ObjectId.from_string('59d23e07aeac50b1495d2584')
    c3c_2 = Cypress::Cat3Calculator.new(['40280381-43DB-D64C-0144-64CB12982D97'], @bundle, correlation_id_2)
    c3c_2.import_cat1_file(file)
    cat3_2 = c3c_2.generate_cat3

    # There are now two single records
    assert_equal before_count + 2, Record.count
    # There are two patient cache values. one for each record.
    assert_equal 2, QME::PatientCache.all.size
    patient_cache = Mongoid.default_client['patient_cache']
    patient_cache.indexes.create_one({ 'value.measure_id' => 1, 'value.sub_id' => 1, 'value.effective_date' => 1, 'value.patient_id' => 1 },
                                     'unique' => true)
  end
end
