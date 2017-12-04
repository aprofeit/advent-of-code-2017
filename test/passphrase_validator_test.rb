require 'minitest/autorun'
require_relative '../lib/passphrase_validator'

class PassphraseValidatorTets < Minitest::Test
  def test_basic_valid_passphrase
    validator = PassphraseValidator.new('aa bb cc dd ee')
    assert_equal true, validator.valid?
  end

  def test_basic_duplicate_words
    validator = PassphraseValidator.new('aa bb cc dd aa')
    assert_equal false, validator.valid?
  end

  def test_basic_similar_non_duplicate_words
    validator = PassphraseValidator.new('aa bb cc dd aaa')
    assert_equal true, validator.valid?
  end

  def test_anagrams_are_not_valid
    validator = PassphraseValidator.new('abcde xyz ecdab')
    assert_equal false, validator.valid?
  end

  def test_multiple_anagrams_are_not_valid
    validator = PassphraseValidator.new('oiii ioii iioi iiio')
    assert_equal false, validator.valid?
  end
end
