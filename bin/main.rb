puts "Welcome!"
puts "Player 1, What is your name?"
@player1 = gets.chomp
puts "Now, Player 2, What is your name?"
@player2 = gets.chomp
puts "Let's play! #{@player1} #{@player2}"
count = 0
while count < 3
puts "Choose a number between 1-9 #{@player1}"
@player1input = gets.chomp
puts "#{@player2} now its your turn, choose a number between 1-9"
@player2 = gets.chomp
count +=1
end