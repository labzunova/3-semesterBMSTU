# frozen_string_literal: true

require_relative 'integral'

# client class
class Main
  integral = Integral.new
  puts 'integral with 10^-3 precision', integral.count(0.001)
  puts 'integral with 10^-4 precision', integral.count(0.0001)
end
