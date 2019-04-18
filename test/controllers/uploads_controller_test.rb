# frozen_string_literal: true

require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  setup do
    bundle = FactoryBot.create(:bundle)
    HealthDataStandards::CQM::Bundle.stubs(:[]).returns(bundle)
    HealthDataStandards::CQM::Bundle.stubs(:bundle_available?).returns(true)
  end

  teardown do
    drop_database
  end

  test 'upload single valid xml' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_III', 'good_cat3.xml'), 'text/xml')

    post 'create', file: file, year: '2018', file_type: 'cat3_r21', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('No errors found'), 'Response for valid XML does not include "No errors found"')
  end

  test 'upload single valid xml with negated valueset' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_I', 'good_cat1_negated_vs.xml'), 'text/xml')

    post 'create', file: file, year: '2018', file_type: 'cat1_r5', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')
    assert(response_body.include?('No errors found'), 'Response for valid XML does not include "No errors found"')
  end

  test 'upload single xml with errors' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_I', 'good_cat1.xml'), 'text/xml')

    post 'create', file: file, year: '2018', file_type: 'cat1_r5', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('No errors found'), 'Response for valid XML does not include "No errors found"')
  end

  test 'upload single xml with hl7 cat 1 schematron errors' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_I', 'cat1_bad_schematron.xml'), 'text/xml')

    post 'create', file: file, year: '2018', file_type: 'cat1_r5', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('QRDA Errors (1)'), 'Response for XML does not include "QRDA Errors (1)"')
  end

  test 'upload single xml with eh cat 1 schematron errors' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_I', 'cat1_bad_schematron.xml'), 'text/xml')

    post 'create', file: file, year: '2019', file_type: 'cat1_r5', program: 'HQR_EHR'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('QRDA Errors (1)'), 'Response for XML does not include "QRDA Errors (1)"')
  end

  test 'upload single xml with ep cat 3 schematron errors' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_III', 'cat3_bad_schematron.xml'), 'text/xml')

    post 'create', file: file, year: '2019', file_type: 'cat3_r21', program: 'CPCPLUS'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('QRDA Errors (28)'), 'Response for XML does not include "QRDA Errors (28)"')
  end

  test 'upload single xml with hl7 cat 3 schematron errors' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_III', 'cat3_bad_schematron.xml'), 'text/xml')

    post 'create', file: file, year: '2019', file_type: 'cat3_r21', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('QRDA Errors (1)'), 'Response for XML does not include "QRDA Errors (28)"')
  end

  test 'upload single broken xml' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_I', 'invalid_cat1.xml'), 'text/xml')

    post 'create', file: file, year: '2018', file_type: 'cat1_r5', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    assert(@response.body.include?('Unable to evaluate file due to error in uploaded XML:'), 'Response for broken XML does not include invalid XML notice.')
  end

  test 'upload zip file' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_III', '2_qrdas.zip'), 'application/zip')

    post 'create', file: file, year: '2018', file_type: 'cat3_r21', program: 'none'

    assert_response :redirect
    test_id = redirect_to_url.split('/')[-1]

    get 'show', id: test_id

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    total_wait_time = 0
    while response_body.include?('Your file is being processed.') && total_wait_time < 300
      total_wait_time += 10
      sleep(10)
      get 'show', id: test_id
      # replace all whitespace with single spaces for validation
      response_body = @response.body.gsub(/\s+/, ' ')
    end

    puts "Total wait time: #{total_wait_time}"

    assert(response_body.include?('No errors found'), 'Response for zip file does not include "No errors found"')
  end

  test 'upload zip file with too many files' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_I', '102_qrdas.zip'), 'application/zip')

    post 'create', file: file, year: '2018', file_type: 'cat1_r5', program: 'none'

    assert_response :redirect

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    assert(@response.body.include?('exceeds upload limits'), 'Response for too many files.')
  end

  test 'upload zip file that is too large' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test', 'fixtures', 'qrda', 'cat_III', 'large_file.zip'), 'application/zip')

    post 'create', file: file, year: '2018', file_type: 'cat3_r1', program: 'none'

    assert_response :redirect

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    assert(@response.body.include?('exceeds upload limits'), 'Response for large files.')
  end
end
