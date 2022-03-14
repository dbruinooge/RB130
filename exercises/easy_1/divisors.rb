def divisors(number)
  result = []
  1.upto(Math.sqrt(number).ceil) do |n|
    if number % n == 0
      result << n
      result << number / n
    end
  end
  result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute