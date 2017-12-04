class PassphraseValidator
  attr_reader :passphrase

  def initialize(passphrase)
    @passphrase = passphrase
  end

  def valid?
    word_counts = Hash.new { |hash, key| hash[key] = 0 }

    passphrase.split(' ').map do |word|
      word.chars.sort
    end.inject(word_counts) do |counts, word|
      counts[word] += 1
      counts
    end.values.none? do |count|
      count != 1
    end
  end
end
