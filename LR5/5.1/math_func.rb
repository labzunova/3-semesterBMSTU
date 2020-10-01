# frozen_string_literal: true

# Math logic
class MathFunc
  def func(arg)
    y = Math.cos(5 * arg / (1 - 6 * arg).to_f)
    y = -Math.sqrt(y)
    y /= (arg * arg)
    y.round(6)
  end
end
