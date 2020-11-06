# frozen_string_literal: true

require_relative 'circle'

# circle realization
#:reek:UncommunicativeParameterName
#:reek:InstanceVariableAssumption
class Sphere < Circle
  def initialize(x, y, r)
    super(x, y, r)
  end

  def x_getter
    @x_center
  end

  def y_getter
    @y_center
  end

  def radius_getter
    @radius
  end

  def volume
    4 * Math::PI * @radius * @radius * @radius / 3
  end
end
