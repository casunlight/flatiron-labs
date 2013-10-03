def factorial(n)
  n <= 1 ? 1 : factorial(n-1) * n
end

puts factorial(-1)
puts factorial(0)
puts factorial(1)
puts factorial(2)
puts factorial(3)
puts factorial(4)
puts factorial(5)
puts factorial(9359)