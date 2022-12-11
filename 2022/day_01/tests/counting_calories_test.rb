require 'minitest/autorun'
require_relative '../src/counting_calories'

class CountingCaloriesTest < Minitest::Test
  def test_most_calories_carried
    filename = "sample.txt"
    file_path = File.join(File.dirname(__FILE__), filename)
    file = File.open(file_path)
    most_calories_carried = CountingCalories.most_calories_carried(file)
    assert most_calories_carried == 24000
  end

end