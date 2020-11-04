# frozen_string_literal: true

# integral counting with Enumerator
=begin
class Integral
  def count(precision)
    arg = 1
    result = 0
    calc_arr = Enum.find do |value|
      (CalcEnum::PRECISE_VALUE - value).abs < eps * 0.1
    result
  end
  def Enum
    Enumerator.new do |yielded|
    arg = 1

    while arg <= 2
      yielded.yield value
      calculation = result += precision * Math.log(arg)
      arg += precision
    end

    p value
    end
  end
  end
end
=end

class Integral
  include Enumerable
  def integral
    sum = 0
    step = 0.01
    loop do
      yield sum
      sum = 0
      1.step(2, step) { |x| sum += Math.log(x) }
      #step /= 10
    end
  end
end

def count(precision)
  real_value = 0,3862943611199
  integral.new.find { |sum| (sum - real_value).abs < precision }
end
