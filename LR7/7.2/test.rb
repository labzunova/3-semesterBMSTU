# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'circle'
require_relative 'sphere'

# testing circle and sphere
class TestMath < Minitest::Test
  def setup; end

  def inheritance_check
    sphere = Sphere.new(1, -1, 2)
    assert(sphere.is_a?(Circle))
  end

  def classes_check
    circle = Circle.new(2, 6, 3)
    sphere = Sphere.new(1, -1, 2)
    assert_equal(circle.square, 28.274333882308138)
    assert_equal(sphere.volume, 33.510321638291124)
  end

  def getters_check
    sphere = Sphere.new(1, -1, 2)
    assert_equal(sphere.x_getter, 1)
    assert_equal(sphere.y_getter, -1)
    assert_equal(sphere.radius_getter, 2)
  end
end
