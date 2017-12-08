require_relative 'lib/reallocator'

def solve(input)
  reallocator1 = Reallocator.new(input.split.map(&:to_i))
  reallocator2 = Reallocator.new(input.split.map(&:to_i), target_visits: 2)
  reallocator1.run
  reallocator2.run

  reallocator2.cycles - reallocator1.cycles
end

puts solve(ARGV[0])
