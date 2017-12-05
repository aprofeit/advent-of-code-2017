require 'minitest/autorun'
require_relative '../lib/cpu'

class CPUTest < Minitest::Test
  def test_single_instruction
    cpu = CPU.new([1])

    assert_equal 1, cpu.steps
  end

  def test_5_steps
    cpu = CPU.new([0, 3, 0, 1, -3])

    assert_equal 5, cpu.steps
  end

  def test_with_custom_incrementor
    cpu = CPU.new([0, 3, 0, 1, -3])

    steps = cpu.steps do |offset|
      if offset >= 3
        -1
      else
        1
      end
    end

    assert_equal 10, steps
  end
end
