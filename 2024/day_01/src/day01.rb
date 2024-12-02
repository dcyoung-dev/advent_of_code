# frozen_string_literal: true

class Day01
  def initialize(file)
    @lines = file.readlines.map(&:chomp)
  end

  def solution
    left_array = []
    right_array = []

    @lines.each do |line|
      left, right = line.scan(/\d+/)

      left_array << left.to_i
      right_array << right.to_i
    end

    total_distance = 0
    left_array.sort.zip(right_array.sort).each do |left, right|
      distance = right - left
      total_distance += if distance.positive?
                          distance
                        else
                          distance * -1
                        end
    end

    total_distance
  end
end
