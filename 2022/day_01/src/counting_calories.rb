class CountingCalories
  def self.most_calories_carried(file)
    calorie_list = file.readlines.map(&:chomp)

    calorie_list.chunk(&:empty?)
                .reject { |(space, _calories)| space }
                .map { |(_space, calories)| calories.map(&:to_i) }
                .map { |calories| calories.inject(0, :+) }
                .max
  end

  def self.total_calories_carried_by_top(file, top_count)
    calorie_list = file.readlines.map(&:chomp)

    calorie_list.chunk(&:empty?)
                      .reject { |(space, _calories)| space }
                      .map { |(_space, calories)| calories.map(&:to_i) }
                      .map { |calories| calories.inject(0, :+) }
                      .sort
                      .reverse
                      .slice(0, top_count)
                      .inject(0, :+)
  end
end