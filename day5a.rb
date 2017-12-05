# http://adventofcode.com/2017/day/5
# part 1

require_relative 'lib/cpu'

def solve(input)
  cpu = CPU.new(input.each_line.map(&:to_i))
  cpu.steps
end

puts solve(ARGV[0])
