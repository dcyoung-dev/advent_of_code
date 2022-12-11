require_relative 'shape'

module Shapes
  class Paper < Shape
    LETTERS = %w[B Y]
    BEATS = "Shapes::Rock"
    POINTS = 2
  end
end
