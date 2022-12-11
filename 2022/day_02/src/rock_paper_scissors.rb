require_relative 'shapes/paper'
require_relative 'shapes/rock'
require_relative 'shapes/scissor'

module Shapes
  SHAPES = [
    Rock,
    Paper,
    Scissor
  ]

  def self.from_strategy(letter)
    klass = SHAPES.find { |shape| shape.for_letter?(letter) }
    klass.new
  end
end

class RockPaperScissors
  ROUND_SCORING = {
    win: 6,
    draw: 3,
    loss: 0
  }

  def self.strategy_score(file)
    new(file).strategy_score
  end

  def initialize(file)
    @strategy = file.readlines.map(&:chomp)
  end

  def strategy_score
    strategy.map { |hand| hand.split(" ") }
            .map { |hand| hand.map { |letter| Shapes.from_strategy(letter) } }
            .map { |hand| play(*hand) }
            .inject(0, :+)

  end

  private

  attr_reader :strategy

  def play(opponent, your_shape)
    result_score = ROUND_SCORING[:loss]
    if your_shape > opponent
      result_score = ROUND_SCORING[:win]
    elsif your_shape == opponent
      result_score = ROUND_SCORING[:draw]
    end

    result_score + your_shape.points
  end
end