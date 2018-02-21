# frozen_string_literal: true

require 'test_helper'
require 'measure_period_validator'

class MeasurePeriodValidatorTest < ActiveSupport::TestCase
  setup do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'good_cat1.xml'), 'text/xml')
    @document = get_document(file)
  end

  test 'Should return error for HQR not aligned to quarter' do
    validator = CypressValidationUtility::Validate::MeasurePeriodValidator.new('HQR_EPM_VOL', 'eh', '2016', 'cat1_r3')
    change_reporting_period(@document, '20160101000000', '20161231000000')
    errors = validator.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
    msg = 'Reported Measurement Period (20160101000000 - 20161231000000) does not align to a quarter (ex, 1/1-3/31, 4/1-6/30, 7/1-9/30, 10/1-12/31).'
    assert_equal msg, errors[0].message
  end

  test 'Should not return error for HQR aligned to quarter' do
    validator = CypressValidationUtility::Validate::MeasurePeriodValidator.new('HQR_EPM_VOL', 'eh', '2016', 'cat1_r3')
    change_reporting_period(@document, '20160401000000', '20160630000000')
    errors = validator.validate(@document)

    assert errors.empty?, "Expected no errors, got #{errors}"
  end

  test 'Should return error for PQRS not aligned to year' do
    validator = CypressValidationUtility::Validate::MeasurePeriodValidator.new('CEC', 'ep', '2016', 'cat1_r3')
    change_reporting_period(@document, '20160103000000', '20161230000000')
    errors = validator.validate(@document)

    assert_equal 2, errors.count, "Expected 2 errors, got #{errors}"

    msg = 'Reported Measurement Period should start on 20160101'
    assert_equal msg, errors[0].message

    msg = 'Reported Measurement Period should end on 20161231'
    assert_equal msg, errors[1].message
  end

  test 'Should not return error for PQRS aligned to year' do
    validator = CypressValidationUtility::Validate::MeasurePeriodValidator.new('CEC', 'ep', '2016', 'cat1_r3')
    change_reporting_period(@document, '20160101000000', '20161231000000')
    errors = validator.validate(@document)

    assert errors.empty?, "Expected no errors, got #{errors}"
  end

  test 'Should not return error for PQRS not aligned to year with MIPS program' do
    validator = CypressValidationUtility::Validate::MeasurePeriodValidator.new('MIPS_INDIV', 'ep', '2016', 'cat1_r3')
    change_reporting_period(@document, '20160103000000', '20161230000000')
    errors = validator.validate(@document)

    assert errors.empty?, "Expected no errors, got #{errors}"
  end

  test 'Should return error for PQRS not aligned to year with MIPS program but not at least a day of data' do
    validator = CypressValidationUtility::Validate::MeasurePeriodValidator.new('MIPS_INDIV', 'ep', '2016', 'cat1_r3')
    change_reporting_period(@document, '20160103000000', '20160102000000')
    errors = validator.validate(@document)

    assert_equal 2, errors.count, "Expected 2 error, got #{errors}"

    msg = 'Reported Measurement Period should be at least 1 day'
    assert_equal msg, errors[0].message
  end

  test 'Should return error for no encounters during rp' do
    validator = CypressValidationUtility::Validate::MeasurePeriodValidator.new('none', 'none', 'none', 'cat1_r3')
    change_reporting_period(@document, '22990101000000', '22991231000000')
    errors = validator.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
    msg = 'Documents must contain at least one encounter or procedure with a discharge date during the reporting period'
    assert_equal msg, errors[0].message
  end

  test 'Should not throw exception on bad document' do
    validator = CypressValidationUtility::Validate::MeasurePeriodValidator.new('none', 'none', 'none', 'cat1_r3')
    @document.xpath('/cda:ClinicalDocument/cda:component').each(&:remove)

    errors = validator.validate(@document)

    assert errors
  end

  # borrowed from cedar
  def change_reporting_period(doc, new_start, new_end)
    # Change the text description
    doc.at_css('item:contains("Reporting period")').content = 'Reporting period: mangled'
    # Mangle the start of the reporting period
    start = doc.at_css('templateId[root="2.16.840.1.113883.10.20.17.3.8"] ~ effectiveTime low')
    start.attributes['value'].value = new_start
    # Mangle the end of the reporting period
    finish = doc.at_css('templateId[root="2.16.840.1.113883.10.20.17.3.8"] ~ effectiveTime high')
    finish.attributes['value'].value = new_end
    # TODO: better, more random dates?
  end
end
