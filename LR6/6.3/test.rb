# frozen_string_literal: true

require 'minitest/autorun'

require_relative 'extrems'

# extrems logic testing
class Test < Minitest::Test
  def setup; end

  def sin_check_lambda
    res = minmax_func(0, 2, ->(arg) { Math.sin(arg / 2 - 1) })
    assert_equal(res[0], -0.9974949866040544)
    assert_equal(res[1], -0.479425538604203)
  end

  def sin_check_block
    res = Extrems.new.minmax_block(left, right) do |arg|
      Math.sin(arg / 2 - 1)
    end
    assert_equal(res[0], -0.9974949866040544)
    assert_equal(res[1], -0.479425538604203)
  end

  def hyperbola_check_lambda
    res = minmax_func(0, 2, ->(arg) { (arg - 1) / (arg + 2) })
    assert_equal(res[0], -1)
    assert_equal(res[1], 0.25)
  end

  def hyperbola_check_block
    res = Extrems.new.minmax_block(left, right) do |arg|
      (arg - 1) / (arg + 2)
    end
    assert_equal(res[0], -1)
    assert_equal(res[1], 0.25)
  end
end
