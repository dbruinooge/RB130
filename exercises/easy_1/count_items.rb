# Further exploration:

def count(array)
  counter = 0
  array.size.times do |index|
    counter += 1 if yield(array[index])
  end
  counter
end

# def count(collection)
#   counter = 0
#   collection.each do |ele|
#     counter += 1 if yield(ele)
#   end
#   counter
# end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
