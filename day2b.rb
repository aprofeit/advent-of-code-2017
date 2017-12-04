# https://adventofcode.com/2017/day/2
# part 2

def solve(input)
  input.each_line.inject(0) do |sum, line|
    row = line.split.map(&:to_i).sort.reverse

    row.each.with_index do |numerator, index|
      if denominator = row[(index + 1)..-1].detect { |number| numerator % number == 0 }
        sum += numerator / denominator
      end
    end
    
    sum
  end
end

puts solve(ARGV[0])
