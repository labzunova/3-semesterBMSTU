# frozen_string_literal: true

# circle realization
# :reek:UncommunicativeParameterName
class Circle
  def initialize(x, y, r)
    @x_center = x
    @y_center = y
    @radius = r
  end

  def x_print
    puts @x_center
  end

  def y_print
    puts @y_center
  end

  def radius_print
    puts @radius
  end

  def square
    Math::PI * @radius * @radius
  end
end
