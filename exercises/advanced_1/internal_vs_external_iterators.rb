factorial = Enumerator.new do |y|
  num = 0
  sum = 1
  loop do
    if [0, 1].include?(num)
      num += 1
      y << sum
      next
    else
      sum *= num
      y << sum
    end
    num += 1
  end
end

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
