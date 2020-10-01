require 'minitest/autorun'
require_relative 'math_func'

# testing math logic
class TestMath < Minitest::Test
  def setup; end

  def test_math
    function = MathFunc.new
    assert_equal(-0.195969, function.func(2))
    assert_equal(-0.735053, function.func(1))
  end
end
