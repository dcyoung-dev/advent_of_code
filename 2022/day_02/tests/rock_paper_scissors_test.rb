require 'minitest/autorun'
require_relative '../src/rock_paper_scissors'

class RockPaperScissorsTest < Minitest::Test
  def test_strategy_score
    filename = "sample.txt"
    file_path = File.join(File.dirname(__FILE__), filename)
    file = File.open(file_path)
    strategy_score = RockPaperScissors.strategy_score(file)
    assert strategy_score == 12
  end
end

class RockTest < Minitest::Test
  def test_comparisons
    assert Shapes::Rock.new < Shapes::Paper.new
    assert Shapes::Rock.new == Shapes::Rock.new
    assert Shapes::Rock.new > Shapes::Scissor.new
  end
end

class PaperTest < Minitest::Test
  def test_comparisons
    assert Shapes::Paper.new < Shapes::Scissor.new
    assert Shapes::Paper.new == Shapes::Paper.new
    assert Shapes::Paper.new > Shapes::Rock.new
  end
end

class ScissorTest < Minitest::Test
  def test_comparisons
    assert Shapes::Scissor.new < Shapes::Rock.new
    assert Shapes::Scissor.new == Shapes::Scissor.new
    assert Shapes::Scissor.new > Shapes::Paper.new
  end
end