def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

p compute(5) { |n| n**2 }
p compute(5)
p compute('hello') { |n| n }
