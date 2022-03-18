class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(array)
    result = []
    key = @word.chars.sort
    array.each do |item|
      result << item if item.downcase.chars.sort == key &&
                        @word != item.downcase
    end
    result
  end
end
