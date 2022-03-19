class Robot
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a

  @@used_names = []

  attr_reader :name

  def initialize
    @name = random_name
    @@used_names << @name
  end

  def reset
    @name = random_name
  end

  private

  def random_name
    loop do
      result = ''
      2.times { result << LETTERS.sample }
      3.times { result << NUMBERS.sample }
      return result unless @@used_names.include?(result)
    end
  end
end
