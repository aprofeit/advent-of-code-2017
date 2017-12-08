require_relative 'circular_array'

class Reallocator
  attr_reader :banks, :target_visits
  attr_accessor :cycles

  def initialize(banks, target_visits: 1)
    @banks = CircularArray.new(banks)
    @target_visits = target_visits

    self.cycles = 0
  end

  def run
    seen = Hash.new { |hash, key| hash[key] = 0 }

    loop do
      break if seen[banks.join] == target_visits
      seen[banks.join] += 1
      self.cycles += 1

      max = banks.max
      i = banks.index(max)
      banks[i] = 0

      until max == 0 do
        i += 1
        max -= 1
        banks[i] += 1
      end
    end
  end
end
