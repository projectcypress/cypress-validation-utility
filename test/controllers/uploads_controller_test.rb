require 'test_helper'
require 'mocha/mini_test'

class UploadsControllerTest < ActionController::TestCase
  setup do
    unzip_if_necessary('measures')
    collection_fixtures('measures', 'bundles')
    bundle = HealthDataStandards::CQM::Bundle.find_by(:version.in => ['2.7.0'])
    # bundle_method = mock
    # bundle_method.stubs(:[]).returns(bundle)
    HealthDataStandards::CQM::Bundle.stubs(:[]).returns(bundle)
    HealthDataStandards::CQM::Bundle.stubs(:bundle_available?).returns(true)
  end

  teardown do
    drop_database
  end

  test 'upload single valid xml' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/good_cat3.xml'), 'text/xml')

    post 'create', file: file, year: '2016', file_type: 'cat3_r1', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('No errors found'), 'Response for valid XML does not include "No errors found"')
  end

  test 'upload single xml with errors' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/5_ASTHMA_A_with_errors.xml'), 'text/xml')

    post 'create', file: file, year: '2016', file_type: 'cat1_r3', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('130 errors found'), 'Response for XML with errors does not include "130 errors found"')
  end

  test 'upload single broken xml' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/invalid_xml.xml'), 'text/xml')

    post 'create', file: file, year: '2016', file_type: 'cat1_r3', program: 'none'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]

    assert(@response.body.include?('Unable to evaluate file due to error parsing XML:'), 'Response for broken XML does not include invalid XML notice.')
  end

  test 'upload zip file' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/2_qrdas.zip'), 'application/zip')

    post 'create', file: file, year: '2016', file_type: 'cat3_r1', program: 'none'

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

  test 'upload single xml with category error' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/wrong_categories.xml'), 'text/xml')

    post 'create', file: file, year: '2016', file_type: 'cat1_r3', program: 'pqrs_mu_individual'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]
    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')

    assert(response_body.include?('has a different category than Templates'), 'Response for valid XML does not include "has a different category than Templates"')
  end

  test 'upload single xml without category error' do
    file = Rack::Test::UploadedFile.new(Rails.root.join('test/fixtures/correct_categories.xml'), 'text/xml')

    post 'create', file: file, year: '2016', file_type: 'cat1_r3', program: 'pqrs_mu_individual'

    assert_response :redirect
    get 'show', id: redirect_to_url.split('/')[-1]
    # replace all whitespace with single spaces for validation
    response_body = @response.body.gsub(/\s+/, ' ')
    assert(response_body.include?('has a different category than Templates'), 'Response for valid XML does not include "has a different category than Templates"')
  end
end
