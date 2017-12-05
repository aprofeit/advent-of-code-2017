# http://adventofcode.com/2017/day/5
# part 2

require_relative 'lib/cpu'

def solve(input)
  cpu = CPU.new(input.each_line.map(&:to_i))

  cpu.steps do |offset|
    if offset >= 3
      -1
    else
      1
    end
  end
end

puts solve(ARGV[0])
