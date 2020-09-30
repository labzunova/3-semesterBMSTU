require 'minitest/unit'
require_relative 'MathFunc'

class TestMath < Minitest::Test
  def setup
  end

  def test_math
    assert_equal(, MathFunc::func(2))
    assert_equal(-0.735053, MathFunc::func(1))
  end
end