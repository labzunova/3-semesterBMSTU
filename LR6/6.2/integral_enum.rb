# frozen_string_literal: true

# class integral
class Integral
  include Enumerable
  def each
    sum = 0
    step = 0.01
    loop do
      yield sum
      sum = 0
      (1.0..2.0).step(step) { |x| sum += step * Math.log(x) }
      step /= 10
    end
  end
end

def count(precision)
  real_value = 0.3862943611199
  Integral.new.find { |sum| (sum - real_value).abs < precision }
end
