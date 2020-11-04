# frozen_string_literal: true

require_relative 'integral_enum'

# client class
class Main
  precision1 = 0.001.to_f
  precision2 = 0.0001.to_f
  puts 'integral with 10^-3 precision', count(precision1)
  puts 'integral with 10^-4 precision', count(precision2)
end
