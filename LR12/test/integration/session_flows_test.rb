require 'test_helper'

class SessionFlowsTest < ActionDispatch::IntegrationTest
  test 'unauthorized user will be redirected to login page' do
    get root_url
    assert_redirected_to controller: :session, action: :login
  end

  test 'user with incorrect credentials will be redirected to login page' do
    post session_create_url, params: { username: "hello", password: "1111" }
    assert_redirected_to controller: :session, action: :login
  end

  test 'user with correct credentials will see the root' do
    password = "1111"

    user = User.create(username: "hello", password: password, password_confirmation: password)

    post session_create_url, params: { username: user.username, password: password }

    assert_redirected_to root_url
  end

  # test 'user will see the root after signing up' do
  #   username = "hello"
  #   password = "1111"
  #
  #   post users_url, params: { user: { username: username, password: password, password_confirmation: password } }
  #
  #   assert_redirected_to user_url(User.last)
  # end

  test 'user can logout' do
    password = "1111"

    user = User.create(username: "hello", password: password, password_confirmation: password)

    post session_create_url, params: { login: user.username, password: password }

    get session_logout_url

    assert_redirected_to controller: :session, action: :login
  end
end