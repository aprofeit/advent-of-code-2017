# https://adventofcode.com/2017/day/3
# part 1

require_relative 'lib/spiral_cursor'

def solve(input)
  cursor = SpiralCursor.new
  cursor.seek(input)
  cursor.steps
end

puts solve(ARGV[0].to_i)
