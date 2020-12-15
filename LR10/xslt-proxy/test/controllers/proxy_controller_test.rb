require 'test_helper'

class ProxyControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get proxy_input_url
    assert_response :success
  end

  test "should get output" do
    get '/proxy/output', params:{ sequence: '123423', side: 'server'}
    assert_response :success
    assert_includes @response.headers['Content-type'], 'text/html'

    get '/proxy/output', params:{ sequence: '123423', side: 'client-with-xslt'}
    assert_response :success
    assert_includes @response.headers['Content-type'], 'application/xml'

    get '/proxy/output', params:{ sequence: '123423', side: 'client'}
    assert_response :success
    assert_includes @response.headers['Content-type'], 'application/xml'
  end
end
