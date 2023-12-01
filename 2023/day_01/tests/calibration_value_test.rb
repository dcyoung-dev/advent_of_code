require "minitest/autorun"
require_relative "../src/calibration"

class CalibrationTest < Minitest::Test
  def test_calibration_extract_two_digit_number
    {
      "1abc2" => 12,
      "pqr3stu8vwx" => 38,
      "a1b2c3d4e5f" => 15,
      "treb7uchet" => 77
    }.each do |line, expected|
      assert_equal expected, Calibration.extract_two_digit_number(line)
    end
  end

  def test_calibration_extract_two_digit_number_including_words
    {
      "two1nine" => 29,
      "eightwothree" => 83,
      "abcone2threexyz" => 13,
      "xtwone3four" => 24,
      "4nineeightseven2" => 42,
      "zoneight234" => 14,
      "7pqrstsixteen" => 76
    }.each do |line, expected|
      assert_equal expected, Calibration.extract_two_digit_number(line, include_words: true)
    end
  end

  def test_calibration_sub_words_with_numbers
    {
      "two1nine" => "219",
      "eightwothree" => "8wo3",
      "abcone2threexyz" => "abc123xyz",
      "xtwone3four" => "x2ne34",
      "4nineeightseven2" => "49eight72",
      "zoneight234" => "z1ight234",
      "7pqrstsixteen" => "7pqrst6teen",
      "zero7pqrstsixteen" => "zero7pqrst6teen"
    }.each do |line, expected|
      assert_equal expected, Calibration.sub_words_with_numbers(line)
    end
  end

  def test_calibration_sum_of_values
    filename = "sample.txt"
    file_path = File.join(File.dirname(__FILE__), filename)
    file = File.open(file_path)

    sum_of_values = Calibration.new(file).sum_of_values

    assert_equal 142, sum_of_values
  end

  def test_calibration_sum_of_values_including_words
    filename = "sample_2.txt"
    file_path = File.join(File.dirname(__FILE__), filename)
    file = File.open(file_path)

    sum_of_values = Calibration.new(file).sum_of_values(include_words: true)

    assert_equal 281, sum_of_values
  end
end
