# frozen_string_literal: true

require 'test_helper'
require 'program_validator'

class ProgramValidatorTest < ActiveSupport::TestCase
  setup do
    @validator = CypressValidationUtility::Validate::ProgramValidator.new('HQR_PI')

    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_I', 'good_cat1.xml'), 'text/xml')
    @document = get_document(file)
  end

  test 'Should return error for document with missing program code' do
    @document.xpath('//cda:informationRecipient').each(&:remove)
    errors = @validator.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
    msg = "Expected to find program 'HQR_PI' but no program code was found."
    assert_equal msg, errors[0].message
  end

  test 'Should return error for document with non-matching program code' do
    node = @document.at_xpath('//cda:informationRecipient/cda:intendedRecipient/cda:id/@extension')
    node.value = 'bobs_house'

    errors = @validator.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
    msg = "CMS Program code 'bobs_house' does not match the expected code for program HQR_PI."
    assert_equal msg, errors[0].message
  end

  test 'Should not return error for document with matching program code' do
    errors = @validator.validate(@document)

    assert errors.empty?
  end
end
