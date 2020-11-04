# frozen_string_literal: true

# Math logic
# :reek:UtilityFunction
class MathFunc
  def func(arg)
    fun = Math.cos(5 * arg / (1 - 6 * arg))
    fun = -Math.sqrt(fun)
    fun /= (arg * arg)
    fun.round(6)
  end
end
