require_relative  '../lib/game.rb'

# Set up game
puts "Welcome!"
puts
print "Player 1, What is your name?: "
player1 = gets.chomp
print "Now, Player 2, What is your name?: "
player2 = gets.chomp
puts
puts "Let's play! #{player1} #{player2}"
puts

game = Game.new(player1, player2)

game.play
