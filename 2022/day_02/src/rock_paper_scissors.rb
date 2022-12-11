require_relative 'shapes/paper'
require_relative 'shapes/rock'
require_relative 'shapes/scissor'

module Shapes
  SHAPES = [
    Rock.new,
    Paper.new,
    Scissor.new
  ]

  def self.from_strategy(letter)
    SHAPES.find { |shape| shape.for_letter?(letter) }
  end
end

class RockPaperScissors
  ROUND_SCORING = {
    win: 6,
    draw: 3,
    loss: 0
  }

  RESULT = {
    "X" => :loss,
    "Y" => :draw,
    "Z" => :win
  }

  def self.strategy_score(file)
    new(file).strategy_score
  end

  def initialize(file)
    @strategy = file.readlines.map(&:chomp)
  end

  def strategy_score
    strategy.map { |hand| hand.split(" ") }
            .map(&method(:convert_to_hand))
            .map { |hand| play(*hand) }
            .inject(0, :+)

  end

  private

  def convert_to_hand(letters)
    shape_letter, result_letter = letters
    opponent_shape = Shapes.from_strategy(shape_letter)
    result_outcome = RESULT.fetch(result_letter)

    case result_outcome
    when :win
      play_shape = Shapes::SHAPES.find { |shape| shape > opponent_shape }
    when :draw
      play_shape = Shapes::SHAPES.find { |shape| shape == opponent_shape }
    when :loss
      play_shape = Shapes::SHAPES.find { |shape| shape < opponent_shape }
    else
      play_shape = nil
    end

    [opponent_shape, play_shape]
  end

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