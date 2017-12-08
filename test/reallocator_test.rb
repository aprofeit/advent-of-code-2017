require 'minitest/autorun'
require_relative '../lib/reallocator'

class ReallocatorTest < Minitest::Test
  def test_example_case
    reallocator = Reallocator.new([0, 2, 7, 0])
    reallocator.run

    assert_equal 5, reallocator.cycles
  end

  def test_passing_target_visits
    reallocator = Reallocator.new([0, 2, 7, 0], target_visits: 2)
    reallocator.run

    assert_equal 9, reallocator.cycles
  end
end
