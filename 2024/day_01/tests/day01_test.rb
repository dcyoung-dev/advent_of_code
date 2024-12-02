# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/Day01'

class Day01Test < Minitest::Test
  def test_solution
    filename = 'sample.txt'
    file_path = File.join(File.dirname(__FILE__), filename)
    file = File.open(file_path)

    total_distance = Day01.new(file).solution

    assert_equal 11, total_distance
  end
end
