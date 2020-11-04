# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'integral_enum'

# testing math logic
class TestMath < Minitest::Test
  def setup; end

  def test_math
    precision1 = 0.001.to_f
    precision2 = 0.0001.to_f
    min_precision = count(precision1)
    max_precision = count(precision2)
    assert(min_precision - 0.001 < 0.3862943611199) && (min_precision + 0.001 > 0.3862943611199)
    assert(max_precision - 0.0001 < 0.3862943611199) && (max_precision + 0.0001 > 0.3862943611199)
  end
end
