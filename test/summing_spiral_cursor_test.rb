require 'minitest/autorun'
require_relative '../lib/summing_spiral_cursor'

class SummingSpiralCursorTest < Minitest::Test

  def setup
    @cursor = SummingSpiralCursor.new
  end

  def test_summing_spiral_cursor_larger_than_1
    @cursor.seek(2)

    assert_equal 4, @cursor.value
  end

  def test_summing_spiral_cursor_larger_than_23
    @cursor.seek(25)

    assert_equal 26, @cursor.value
  end
end
