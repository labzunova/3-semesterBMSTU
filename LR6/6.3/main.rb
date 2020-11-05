# frozen_string_literal: true

require_relative 'extrems'
# client class
class Main
  puts 'hyperbola or sin'
  case gets.chomp
  when 'sin'
    a = -1
    b = 1
    func = ->(x) { Math.sin(x/2-1) }
  when 'hyperbola'
    a = 0
    b = 2
    func = ->(x) { (x-1)/(x+2) }
    else puts 'invalid'
  end

  puts 'block or lambda'
  case gets.chomp
  when 'block'
    Extrems.new.minmax_block(a,b) do |x|
      (x-1)/(x+2)
    end
  when 'lambda'
    Extrems.new.minmax_func(a,b,func)
  else puts 'invalid'
  end
  # puts 'minmax2:  ', minmax(-1,1)
end
