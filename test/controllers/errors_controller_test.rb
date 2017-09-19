# frozen_string_literal: true
require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test 'should get 404' do
    assert_routing('/404', controller: 'errors', action: 'show', code: '404')
    assert_routing('/lksdjlksdjfsfs', controller: 'errors', action: '404', unmatched_route: 'lksdjlksdjfsfs')

    get 'show', code: '404'
    assert_response :missing
  end

  test 'should get 400' do
    assert_routing('/400', controller: 'errors', action: 'show', code: '400')

    get 'show', code: '400'
    assert_response 400
  end

  test 'should get 500' do
    assert_routing('/500', controller: 'errors', action: 'show', code: '500')

    get 'show', code: '500'
    assert_response :error
  end
end
