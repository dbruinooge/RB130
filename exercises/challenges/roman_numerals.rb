#2:55
#3:13

class RomanNumeral
  def initialize(number)
    @number = number
  end

  def to_roman
    thousands + hundreds + tens + ones
  end

  def ones
    remainder = @number % 10
    case remainder
    when 9
      'IX'
    when 5..8
      'V' + ('I' * (remainder - 5))
    when 4
      'IV'
    when 1..3
      'I' * remainder
    else
      ''
    end
  end

  def tens
    remainder = (@number % 100) / 10
    case remainder
    when 9
      'XC'
    when 5..8
      'L' + ('X' * (remainder - 5))
    when 4
      'XL'
    when 1..3
      'X' * remainder
    else
      ''
    end
  end

  def hundreds
    remainder = (@number % 1000) / 100
    case remainder
    when 9
      'CM'
    when 5..8
      'D' + ('C' * (remainder - 5))
    when 4
      'CD'
    when 1..3
      'C' * remainder
    else
      ''
    end
  end

  def thousands
    remainder = @number / 1000
    case remainder
    when 1..3
      'M' * remainder
    else
      ''
    end
  end
end
