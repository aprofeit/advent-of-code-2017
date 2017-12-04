# https://adventofcode.com/2017/day/1
# part 2

require_relative 'lib/circular_array'

def solve(input)
  digits = input.to_s.chars.map(&:to_i)

  arr = CircularArray.new(digits)

  digits.each.with_index.inject(0) do |sum, (digit, i)|
    if digit == arr[i + digits.length / 2]
      sum += digit
    end
    sum
  end
end

puts solve(ARGV[0])
