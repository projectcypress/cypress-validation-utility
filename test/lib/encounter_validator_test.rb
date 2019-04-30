# frozen_string_literal: true

require 'test_helper'
require 'program_validator'

class ProgramValidatorTest < ActiveSupport::TestCase
  setup do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_I', 'good_cat1_single_encounter.xml'), 'text/xml')
    @document = get_document(file)
  end

  test 'Should return no error for document with correct encounter times' do
    errors = EncounterValidator.instance.validate(@document)

    assert_equal 0, errors.count, "Expected 0 error, got #{errors}"
  end

  test 'Should return error for start after end' do
    change_encounter_period(@document, '20160829160000', '20160829150000')
    errors = EncounterValidator.instance.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
  end

  test 'Should return errors start date that is too long' do
    change_encounter_period(@document, '201608291400000000000', '20160829150000')
    errors = EncounterValidator.instance.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
  end

  test 'Should return errors end date that is too long' do
    change_encounter_period(@document, '20160829140000', '201608291500000000000')
    errors = EncounterValidator.instance.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
  end

  test 'Should return errors end date that is in the future' do
    change_encounter_period(@document, '20160829140000', '20200829150000')
    errors = EncounterValidator.instance.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
  end

  test 'Should return errors with no time' do
    @document.at_css('templateId[root="2.16.840.1.113883.10.20.24.3.23"] ~ effectiveTime low').remove
    errors = EncounterValidator.instance.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
  end

  # borrowed from cedar
  def change_encounter_period(doc, new_start, new_end)
    # Mangle the start of the reporting period
    start = doc.at_css('templateId[root="2.16.840.1.113883.10.20.24.3.23"] ~ effectiveTime low')
    start.attributes['value'].value = new_start
    # Mangle the end of the reporting period
    finish = doc.at_css('templateId[root="2.16.840.1.113883.10.20.24.3.23"] ~ effectiveTime high')
    finish.attributes['value'].value = new_end
  end
end
