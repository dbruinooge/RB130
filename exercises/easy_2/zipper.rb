def zip(array1, array2)
  counter = -1
  array1.map do |n|
    counter += 1
    [n, array2[counter]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
