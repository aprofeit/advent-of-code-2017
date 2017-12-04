# https://adventofcode.com/2017/day/2
# part 1

def solve(input)
  input.each_line.inject(0) do |sum, line|
    row = line.split.map(&:to_i)
    sum += row.max - row.min
  end
end

puts solve(ARGV[0])
