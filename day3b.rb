# https://adventofcode.com/2017/day/4
# part 2

require_relative 'lib/summing_spiral_cursor'

def solve(input)
  cursor = SummingSpiralCursor.new
  cursor.seek(input)
  cursor.value
end

puts solve(ARGV[0].to_i)
