require_relative 'shape'

module Shapes
  class Rock < Shape
    LETTERS = %w[A X]
    BEATS = "Shapes::Scissor"
    POINTS = 1
  end
end