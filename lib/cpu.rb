class CPU
  attr_reader :instructions

  def initialize(instructions)
    @instructions = instructions
  end

  def steps
    cursor = 0
    steps = 0

    loop do
      steps += 1
      offset = instructions[cursor]

      if block_given?
        instructions[cursor] += yield(offset)
      else
        instructions[cursor] += 1
      end

      cursor += offset

      if cursor >= instructions.size || cursor < 0
        break
      end
    end

    steps
  end
end
