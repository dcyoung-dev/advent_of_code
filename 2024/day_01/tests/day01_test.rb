# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/Day01'

class Day01Test < Minitest::Test
  def test_part_one
    filename = 'sample.txt'
    file_path = File.join(File.dirname(__FILE__), filename)
    file = File.open(file_path)

    total_distance = Day01.new(file).part_one

    assert_equal 11, total_distance
  end

  def test_part_two
    filename = 'sample.txt'
    file_path = File.join(File.dirname(__FILE__), filename)
    file = File.open(file_path)

    similarity = Day01.new(file).part_two

    assert_equal 31, similarity
  end
end
