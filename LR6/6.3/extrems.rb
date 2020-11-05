# frozen_string_literal: true

# minmax class
class Extrems
  def minmax_func(a,b,func)
    min = func.call(0)
    max = func.call(0)
    a.step(b,0.01) do |i|
        if func.call(i) < min
          min = func.call(i)
        end
        if func.call(i) > max
          max = func.call(i)
        end
    end
    puts "min", min
    puts "max", max
  end

  def minmax_block(a,b)
    min = yield(0)
    max = yield(0)
    a.step(b,0.01) do |i|
        if yield(i) < min
          min = yield(i)
        end
        if yield(i) > max
          max = yield(i)
        end
    end
    puts "min", min
    puts "max", max
  end
end

