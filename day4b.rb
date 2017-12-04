require_relative 'lib/passphrase_validator'

def solve(input)
  input.each_line.count do |line|
    validator = PassphraseValidator.new(line)
    validator.valid?
  end
end

puts solve(ARGV[0])
