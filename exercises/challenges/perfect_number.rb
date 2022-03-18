class PerfectNumber
  def initialize(number)
    raise StandardError if number < 0
    @number = number
  end

  def self.classify(number)
    perfect_number = PerfectNumber.new(number)
    if perfect_number.abundant?
      'abundant'
    elsif perfect_number.perfect?
      'perfect'
    elsif perfect_number.deficient?
      'deficient'
    end
  end

  def abundant?
    aliquot_sum > @number
  end

  def perfect?
    aliquot_sum == @number
  end

  def deficient?
    aliquot_sum < @number
  end

  def aliquot_sum
    sum = 0
    1.upto(@number - 1) do |n|
      sum += n if @number % n == 0
    end
    sum
  end
end
