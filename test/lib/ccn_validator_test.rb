# frozen_string_literal: true

require 'test_helper'
require 'ccn_validator'

class CCNValidatorTest < ActiveSupport::TestCase
  setup do
    @validator = CypressValidationUtility::Validate::CCNValidator.instance

    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'good_cat1.xml'), 'text/xml')
    @document = get_document(file)
  end

  CCN_SELECTOR = "/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:id[@root='2.16.840.1.113883.4.336']/@extension"

  test 'Should return error for document missing CCN' do
    @document.at_xpath(CCN_SELECTOR).parent.remove
    errors = @validator.validate(@document)

    assert_equal 1, errors.count, "Expected 1 error, got #{errors}"
    msg = 'Test documents for EH submission must use a fixed CCN of 800890 when no hospital is associated with the document'
    assert_equal msg, errors[0].message
  end

  test 'Should not return errors document with dummy CCN' do
    node = @document.at_xpath(CCN_SELECTOR)
    node.value = '800890'

    errors = @validator.validate(@document)
    assert errors.empty?, "Expected no errors, got #{errors}"
  end

  test 'Should not return errors document with another CCN' do
    node = @document.at_xpath(CCN_SELECTOR)
    node.value = '220022'

    errors = @validator.validate(@document)
    assert errors.empty?, "Expected no errors, got #{errors}"
  end

  test 'Should not throw exception on bad document' do
    @document.xpath('/cda:ClinicalDocument/cda:custodian').each(&:remove)

    errors = @validator.validate(@document)

    assert errors
  end
end
