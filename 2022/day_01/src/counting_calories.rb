class CountingCalories
  def self.most_calories_carried(file)
    new(file).most_calories_carried
  end

  def self.total_calories_carried_by_top(file, top_count)
    new(file).total_calories_carried_by_top(top_count)
  end

  def initialize(file)
    @calorie_list = file.readlines.map(&:chomp)
  end

  def most_calories_carried
    calorie_list.chunk(&:empty?)
                .reject { |(space, _calories)| space }
                .map { |(_space, calories)| calories.map(&:to_i) }
                .map { |calories| calories.inject(0, :+) }
                .max
  end

  def total_calories_carried_by_top(top_count)
    calorie_list.chunk(&:empty?)
                .reject { |(space, _calories)| space }
                .map { |(_space, calories)| calories.map(&:to_i) }
                .map { |calories| calories.inject(0, :+) }
                .sort
                .reverse
                .slice(0, top_count)
                .inject(0, :+)
    end

  private

  attr_reader :calorie_list
end