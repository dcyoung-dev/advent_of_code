require_relative 'shape'

module Shapes
  class Scissor < Shape
    LETTERS = %w[C Z]
    BEATS = "Shapes::Paper"
    POINTS = 3
  end
end