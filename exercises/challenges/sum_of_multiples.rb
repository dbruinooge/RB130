class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end

  def to(number)
    multiples = (1...number).to_a.select do |count_num|
      @set.any? { |set_num| count_num % set_num == 0 }
    end
    multiples.sum
  end
end
