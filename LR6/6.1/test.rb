# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'integral'

# :reek:TooManyStatements
# testing math logic
class TestMath < Minitest::Test
  def setup; end

  def test_math
    truth = 0.3862943611199
    integral = Integral.new
    min_precision = integral.count(0.001)
    max_precision = integral.count(0.0001)
    assert(min_precision - 0.001 < truth) && (min_precision + 0.001 > truth)
    assert(max_precision - 0.0001 < truth) && (max_precision + 0.0001 > truth)
  end
end
