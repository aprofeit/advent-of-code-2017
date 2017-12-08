require_relative 'lib/reallocator'

def solve(input)
  reallocator = Reallocator.new(input.split.map(&:to_i))
  reallocator.run
  reallocator.cycles
end

puts solve(ARGV[0])
