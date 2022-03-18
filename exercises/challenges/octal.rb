class Octal
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 unless valid?
    sum = 0
    @number.to_i.digits.each_with_index do |digit, index|
      sum += digit * (8**index)
    end
    sum
  end

  private

  def valid?
    @number.match(/\A\d+\z/) &&
      @number.to_i.digits.all? { |n| n < 8 }
  end
end
