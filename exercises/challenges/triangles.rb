class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError unless valid_triangle?
  end

  def kind
    return 'equilateral' if equilateral?
    return 'isosceles' if isosceles?
    return 'scalene' if scalene?
  end

  private

  def valid_triangle?
    @sides.all? { |s| s > 0 } &&
      @sides.max < @sides.sort[0..1].sum
  end

  def equilateral?
    @sides.uniq.size == 1
  end

  def isosceles?
    @sides.uniq.size == 2
  end

  def scalene?
    @sides.uniq.size == 3
  end
end
