# frozen_string_literal: true

require_relative 'circle'
require_relative 'sphere'

# client class
class Main
  circle = Circle.new(0, 0, 1)
  sphere = Sphere.new(0, 0, 1)
  puts 'x is', sphere.x_getter
  puts 'y is', sphere.y_getter
  puts 'radius is', sphere.radius_getter
  puts 'sphere is a circles child' if sphere.is_a? Circle
  puts 'square of circle', circle.square
  puts 'volume of sphere', sphere.volume
end
