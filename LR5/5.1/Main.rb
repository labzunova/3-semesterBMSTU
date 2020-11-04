# frozen_string_literal: true

require_relative 'math_func'

# client class
class Main
  puts 'enter x'
  arg = begin
          Integer(gets.chomp)
        rescue StandardError
          nil
        end
  abort 'NaN' unless arg.is_a? Numeric
  arg = arg.to_i
  math = MathFunc.new
  fun = math.func(arg)
  puts 'Result of -sqrt(cos(5*x/(1-6*x)))/(x*x): ', fun
end
