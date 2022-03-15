# def max_by(array)
#   return nil if array.empty?
#   highest_element = array.first
#   highest_value = yield(highest_element)
#   array.each do |current_element|
#     current_value = yield(current_element)
#     if current_value > highest_value
#       highest_value = current_value
#       highest_element = current_element
#     end
#   end
#   highest_element
# end

def max_by(array)
  array.sort_by {|ele| yield(ele) }.last
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
