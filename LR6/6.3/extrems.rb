# frozen_string_literal: true

# minmax class
class Extrems
  # :reek:TooManyStatements
  # :reek:UtilityFunction
  def minmax_func(left, right, func)
    min = func.call(0)
    max = min
    left.step(right, 0.01) do |arg|
      value = func.call(arg)
      min = value if value < min
      max = value if value > max
    end
    [min, max]
  end

  # :reek:TooManyStatements
  # :reek:UtilityFunction
  def minmax_block(left, right)
    min = yield(0)
    max = min
    left.step(right, 0.01) do |arg|
      min = yield(arg) if yield(arg) < min
      max = yield(arg) if yield(arg) > max
    end
    [min, max]
  end
end
