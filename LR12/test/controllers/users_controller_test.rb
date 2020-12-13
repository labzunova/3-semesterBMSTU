require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post session_login_url , params: { user: {username: 'userrr', password_digest: '1111' } }
    # @user = User.new({ username: 'cat111', password_digest: '1111' })
  end

  test "should redirect from index" do
    get users_url
    assert_redirected_to session_login_url
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  # test "should create user" do
  #   count = User.count
  #   @user = User.new({ username: 'cat1111', password_digest: '1111' })
  #   assert_equal(count + 1, User.count)
  #
  #   assert_redirected_to user_url(User.last)
  # end

  # test "should show user" do
  #   get user_url(@user)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_user_url(@user)
  #   assert_response :success
  # end
  test "get output" do
    get '/output'
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { last_login_at: @user.last_login_at, password_digest: @user.password_digest, username: @user.username } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  # setup do
  #   @user = users(:one)
  # end
  #
  # test 'should get new' do
  #   get new_user_url
  #   assert_response :success
  # end
  #
  # test 'should create user' do
  #   assert_difference('User.count') do
  #     post users_url, params: { user: {username: 'userrr', password_digest: '1111' } }
  #   end
  #   assert_redirected_to user_url(User.last)
  # end

end
