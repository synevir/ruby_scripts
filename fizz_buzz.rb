range = 30

for i in 1..range do
  if (i%15 == 0) then; puts 'FizzBuzz'
  elsif (i%5 == 0);    puts 'Buzz'
  elsif (i%3 == 0);    puts 'Fizz'
  else
    puts i
  end
end
puts "------------------------"

