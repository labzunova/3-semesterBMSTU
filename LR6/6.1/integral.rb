# frozen_string_literal: true

# integral counting
class Integral
  def count(precision)
    arg = 1
    result = 0
    while arg <= 2
      result += precision * Math.log(arg)
      arg += precision
    end
    result
  end
end
