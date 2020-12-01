# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'extrems'

# extrems logic testing
class TestMath < Minitest::Test
  def setup; end

  def test_math2
    extrems = Extrems.new
    res = extrems.minmax_func(0, 2, ->(arg) { Math.sin(arg / 2 - 1) })
    assert_equal(res[0], -0.8414709848078965)
    assert_equal(res[1], 0)
  end

  def test_math1
    extrems = Extrems.new
    res = extrems.minmax_block(0, 2) do |arg|
      Math.sin(arg / 2 - 1)
    end
    assert_equal(res[0], -0.8414709848078965)
    assert_equal(res[1], 0.0)
  end

  def test_math3
    extrems = Extrems.new
    res =extrems.minmax_func(0, 2, ->(arg) { (arg - 1) / (arg + 2) })
    assert_equal(res[0], -1)
    assert_equal(res[1], 0.25)
  end

  def test_math4
    extrems = Extrems.new
    res = extrems.minmax_block(-1, 0  ) do |arg|
      (arg - 1) / (arg + 2)
    end
    assert_equal(res[0], -2)
    assert_equal(res[1], -0.5)
  end
end
