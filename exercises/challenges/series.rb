class Series
  def initialize(number_string)
    @digits = number_string.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @digits.size
    result = []
    index = 0
    while index <= @digits.size - length
      result << (length == 1 ? [@digits[index]] : @digits[index, length])
      index += 1
    end
    result
  end
end
