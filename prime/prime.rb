def prime?(number)
  false if number <= 1
  !(2...(number**0.5)).any? do |divisor|
    number%divisor == 0
  end
end

(0..100).each do |number|
  #puts number if prime?(number)
  puts "#{number}.prime? #=> #{prime?(number)}"
end