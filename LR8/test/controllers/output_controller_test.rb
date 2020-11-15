require 'test_helper'

class OutputControllerTest < ActionDispatch::IntegrationTest
  test "get output" do
    get '/output'
    assert_response :success
  end

  test "should get 123 for test with 12323180" do
    get :'/output', params: {sequence: 12323180}
    assert_equal assigns[:max], "maximum length rising subsequence: 123"
  end

  test "should get 'no rising' for test with 11111" do
    get :'/output', params: {sequence: 111111}
    assert_equal assigns[:subsequences], "There are no rising subsequences"
  end

  test "should get an error for NaN" do
    get '/output', params: {sequence: "qwerty"}
    assert_equal assigns[:output], "please, enter a number"
  end

  test "should get an error for empty input" do
    get '/output', params: {sequence: ""}
    assert_equal assigns[:output], "you didn't write anything:("
  end
end
