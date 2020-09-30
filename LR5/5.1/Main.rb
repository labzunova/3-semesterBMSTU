require_relative 'MathFunc'

class Main
  puts 'enter x'
  arg = Integer(gets.chomp) rescue nil
  unless arg.is_a? Numeric
    abort 'NaN'
  end
  arg = arg.to_i
  math = MathFunc.new
  y = math.func(arg)
    puts 'Result of -sqrt(cos(5*x/(1-6*x)))/(x*x): ', y
end
