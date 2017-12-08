require 'minitest/autorun'
require_relative '../lib/circular_array'

class CircularArrayTest < Minitest::Test
  def test_regular_access
    array = CircularArray.new([1])

    assert_equal 1, array[0]
  end

  def test_looping_once
    array = CircularArray.new([1, 2, 3])

    assert_equal 1, array[3]
  end

  def test_looping_multiple_times
    array = CircularArray.new([1, 2, 3])

    assert_equal 1, array[9]
  end

  def test_negative_access
    array = CircularArray.new([1, 2, 3])

    assert_equal 3, array[-1]
  end

  def test_setting_elements
    array = CircularArray.new([3, 3, 3])

    array[4] = 1

    assert_equal 1, array[1]
  end
end
