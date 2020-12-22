require 'test_helper'

class OutputControllerTest < ActionDispatch::IntegrationTest
  test "get output" do
    get result_path
    assert_response :success
  end

  test "should get 'no rising' for test with 11111" do
    get result_path, params: {sequence: 111111}
    assert_equal assigns[:result],"There are no rising subsequences"
  end

  test "should get an error for NaN" do
    get result_path, params: {sequence: "qwerty"}
    assert_equal assigns[:result], "please, enter a number"
  end

  test "should get an error for empty input" do
    get result_path, params: {sequence: ""}
    assert_equal assigns[:result], "you did not write anything:("
  end
end
