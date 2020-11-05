# frozen_string_literal: true

require_relative 'extrems'
# client class
class Main
  res = []
  puts 'hyperbola or sin'
  case gets.chomp
  when 'sin'
    left = -1
    right = 1
    func = ->(arg) { Math.sin(arg / 2 - 1) }
  when 'hyperbola'
    left = 0
    right = 2
    func = ->(arg) { (arg - 1) / (arg + 2) }
  else puts 'invalid'
  end

  puts 'block or lambda'
  case gets.chomp
  when 'block'
    res = Extrems.new.minmax_block(left, right) do |arg|
      (arg - 1) / (arg + 2)
    end
  when 'lambda'
    res = Extrems.new.minmax_func(left, right, func)
  else puts 'invalid'
  end
  puts 'min', res[0]
  puts 'max', res[1]
end
