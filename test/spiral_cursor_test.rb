require 'minitest/autorun'
require_relative '../lib/spiral_cursor'

class SpiralCursorTest < Minitest::Test
  def setup
    @cursor = SpiralCursor.new
  end

  def test_seeking_address_1
    @cursor.seek(1)

    assert_equal 0, @cursor.position.x
    assert_equal 0, @cursor.position.y
  end

  def test_seeking_address_2
    @cursor.seek(2)

    assert_equal 1, @cursor.position.x
    assert_equal 0, @cursor.position.y
  end

  def test_seeking_address_12
    @cursor.seek(12)

    assert_equal 2, @cursor.position.x
    assert_equal 1, @cursor.position.y
  end

  def test_counting_steps_to_1024
    @cursor.seek(1024)

    assert_equal 31, @cursor.steps
  end
end
