def step(starting, ending, stepping)
  current = starting
  while current <= ending do
    yield(current)
    current += stepping
  end
  current
end

step(1, 10, 4) { |value| puts "value = #{value}" }
