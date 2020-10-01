require 'minitest/unit'
require_relative 'math_func'

# testing math logic
class TestMath < Minitest::Test
  def setup; end

  def test_math
    assert_equal(2, MathFunc.func(2))
    assert_equal(-0.735053, MathFunc.func(1))
  end
end
