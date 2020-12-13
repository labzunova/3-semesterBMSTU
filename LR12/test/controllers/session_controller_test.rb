require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get session_login_url
    assert_response :success
  end

  # при выходе редиректит на страницу входу
  test "should get logout" do
    get '/logout'
    assert_redirected_to session_login_url
  end

  # не можем перейти на главную страницу без авторизации
  test "can't calculate without login" do
    get '/'
    assert_redirected_to session_login_url
  end
end
