# frozen_string_literal: true
require 'test_helper'
require 'cat3_population_validator'

class Cat3PopulationValidatorTest < ActiveSupport::TestCase
  setup do
    @validator = CypressValidationUtility::Validate::Cat3PopulationValidator.instance

    file = Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/good_cat3.xml'), 'text/xml')
    @document = get_document(file)
  end

  test 'Should return error for document with bad data' do
    numer_greater_than_denom(@document)

    errors = @validator.validate(@document)

    assert_equal 1, errors.count

    expected_text_fmt = /Numerator value \d+ \+ Denominator Exclusions value \d+ \+ Denominator Exceptions value \d+ is greater than Denominator value \d+ for measure .*/

    assert errors[0].message.match(expected_text_fmt), 'Error message does not match the expected format'
  end

  test 'Should not return errors for good document' do
    errors = @validator.validate(@document)

    assert errors.empty?, "Expected no errors for good Cat 3 document, found #{errors}"
  end

  test 'Should not throw exception on bad document' do
    @document.xpath('/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component').each(&:remove)

    errors = @validator.validate(@document)

    assert errors
  end

  # borrowed from Cedar
  def numer_greater_than_denom(doc)
    # TODO: Filter out continuous measures for this validation (and potentially others)
    # Find the NUMER and DENOM
    numer = doc.at_css('value[code="NUMER"] ~ entryRelationship[typeCode="SUBJ"] observation value')
    denom = doc.at_css('value[code="DENOM"] ~ entryRelationship[typeCode="SUBJ"] observation value')
    denom_value = denom.attributes['value'].value.to_i
    # Add a random amount to DENOM and store it in NUMER
    numer_value = denom_value + Random.new.rand(1..10)
    numer.attributes['value'].value = numer_value.to_s
  end
end
