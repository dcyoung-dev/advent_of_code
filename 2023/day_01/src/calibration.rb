# frozen_string_literal: true

class Calibration
  def self.extract_two_digit_number(line, include_words: false)
    line = sub_words_with_numbers(line) if include_words

    first = line[/\d/].to_i
    last = line.reverse[/\d/].to_i

    "#{first}#{last}".to_i
  end

  def self.sub_words_with_numbers(word)
    number_words = %w[one two three four five six seven eight nine]

    reg = Regexp.new(number_words.join("|"))
    first, *_, last = word.scan(reg).compact

    first_index = number_words.index(first)
    last_index = number_words.index(last)

    word = word.gsub(/#{first}/i, (first_index + 1).to_s) unless first_index.nil?
    word = word.gsub(/#{last}/i, (last_index + 1).to_s) unless last_index.nil?

    word
  end

  def initialize(file)
    @calibration_values = file.readlines.map(&:chomp)
  end

  def sum_of_values(include_words: false)
    calibration_values.map { |line| Calibration.extract_two_digit_number(line, include_words: include_words) }.inject(0, :+)
  end

  private

  attr_reader :calibration_values
end
