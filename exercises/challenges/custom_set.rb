class CustomSet
  def initialize(array = [])
    @list = array
  end

  def empty?
    list.empty?
  end

  def contains?(element)
    list.include?(element)
  end

  def subset?(set)
    list.all? { |ele| set.contains?(ele) }
  end

  def disjoint?(set)
    list.none? { |ele| set.contains?(ele) }
  end

  def eql?(set)
    list == set.list
  end

  def add(element)
    @list.append(element)
    CustomSet.new(list)
  end

  def ==(other)
    list == other.list
  end

  def intersection(set)
    common_elements = list.select { |ele| set.contains?(ele) }
    CustomSet.new(common_elements)
  end

  def difference(set)
    different_elements = list.select { |ele| !set.contains?(ele) }
    CustomSet.new(different_elements)
  end

  def union(set)
    elements = intersection(set).list +
               difference(set).list   +
               set.difference(self).list
    CustomSet.new(elements)
  end

  protected

  def list
    @list.uniq.sort
  end
end
