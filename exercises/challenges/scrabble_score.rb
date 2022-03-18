class Scrabble
  SCORES = { 1 => %w(a e i o u l n r s t), 2 => %w(d g), 3 => %w(b c m p),
             4 => %w(f h v w y), 5 => %w(k), 8 => %w(j x), 10 => %w(q z) }

  def initialize(word)
    @word = word.nil? ? '' : word.downcase
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    result = 0
    @word.chars.each do |letter|
      result += point_value(letter)
    end
    result
  end

  private

  def point_value(letter)
    points = 0
    SCORES.each do |value, letters|
      points = value if letters.include?(letter)
    end
    points
  end
end
