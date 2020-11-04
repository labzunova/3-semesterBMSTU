# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'integral'

# testing math logic
class TestMath < Minitest::Test
  def setup; end

  def test_math
    integral = Integral.new
    min_precision = integral.count(0.001)
    max_precision = integral.count(0.0001)
    assert(min_precision - 0.001 < 0.3862943611199) && (min_precision + 0.001 > 0.3862943611199)
    assert(max_precision - 0.0001 < 0.3862943611199) && (max_precision + 0.0001 > 0.3862943611199)
  end
end
