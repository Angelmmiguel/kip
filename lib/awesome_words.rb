#
# Return some positive words to use in placeholders
#
class AwesomeWords
  # Words
  WORDS = %w(awesome fantastic fabulous marvelous great
             amazing sensational).freeze

  # Return a random word
  #
  # @return [String] Positive word :)
  #
  def self.sample
    WORDS.sample
  end
end
