# frozen_string_literal: true

class Day01
  def initialize(file)
    lines = file.readlines.map(&:chomp)
    left_array = []
    right_array = []

    lines.each do |line|
      left, right = line.scan(/\d+/)

      left_array << left.to_i
      right_array << right.to_i
    end

    @left_array = left_array.sort
    @right_array = right_array.sort
  end

  def part_one
    left_array.zip(right_array).inject(0) { |sum, (left, right)| sum + distance_between(left, right) }
  end

  def part_two
    similarities = left_array.map do |left|
      # number of time left appears in the right array
      multiplier = right_array.count { |right| right == left }
      left * multiplier
    end


    similarities.sum
  end

  private

  def distance_between(left, right)
    raw_distance = right - left
    raw_distance.positive? ? raw_distance : raw_distance * -1
  end

  attr_reader :left_array, :right_array
end
