class Element
  attr_accessor :next

  def initialize(value, next_element = nil)
    @value = value
    @next = next_element
  end

  def datum
    @value
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?
    array.reverse.each { |ele| list.push(ele) }
    list
  end

  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(element)
    @list << Element.new(element, head)
  end

  def peek
    return nil if @list.empty?
    @list.last.datum
  end

  def head
    @list.last
  end

  def pop
    @list.pop.datum
  end

  def to_a
    @list.reverse.map(&:datum)
  end

  def reverse
    result = SimpleLinkedList.new
    @list.reverse.each { |ele| result.push(ele.datum) }
    result
  end
end
