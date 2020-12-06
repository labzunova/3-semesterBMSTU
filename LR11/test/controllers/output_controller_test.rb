require 'test_helper'

class OutputControllerTest < ActionDispatch::IntegrationTest
  test 'get output' do
    get '/output'
    assert_response :success
  end

  test 'test_return_json' do
    get '/output', params: { sequence: 1245, format: 'json' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/json'
  end

  test 'should put result in db' do
    before = Output.count
    get '/output', params: { sequence: 1245 }
    after = Output.count

    assert_equal before + 1, after
  end

  test 'test_different_response' do
    get '/output', params: { sequence: 1245 }
    first = assigns[:subsequences]
    get '/output', params: { sequence: 8567 }
    second = assigns[:subsequences]
    refute_equal first, second
  end

  test 'test_different_response_json' do
    get '/output', params: { sequence: 1245, format: 'json' }
    first = JSON.parse @response.body

    get '/output', params: { sequence: 245678, format: 'json' }
    second = JSON.parse @response.body
    refute_equal first, second
  end
end
