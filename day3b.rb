require_relative 'lib/summing_spiral_cursor'

def solve(input)
  cursor = SummingSpiralCursor.new
  cursor.seek(input)
  cursor.value
end

puts solve(ARGV[0].to_i)
