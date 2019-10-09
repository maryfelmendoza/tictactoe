require_relative  '../lib/game.rb'

# puts "Welcome!"
# puts
# print "Player 1, What is your name?: "
# player1 = gets.chomp
# print "Now, Player 2, What is your name?: "
# player2 = gets.chomp
# puts
# puts "Let's play! #{player1} #{player2}"
# puts

player1 = "Apple"
player2 = "Banana"

game = Game.new(player1, player2)

loop do
  puts "Pick a box to play #{player1}!"
  box = gets.chomp.to_i
  game.play(player1, box)
  break if game.game_over[0] == true
  
  puts "It's your turn to pick #{player2}"
  box = gets.chomp.to_i
  game.play(player2, box)
  break if game.game_over[0] == true
end

if game.game_over[0] == true
  puts "GAME OVER #{game.game_over[1]}!"
end


=begin


1. welcome player
2. get player names
3. start the game

>>>>> GAME CLASS <<<<<
- call game class

  >>> def play <<<
******** LOOP START
 4. let player 1 input
  - check if player won
  - display updated board
 5. switch to player 2
  - check if player won
  - display updated board
******** LOOP END

 >>> def game_over <<<
 6. if game over
  - Win?
  - Tie?
  - Start again?  

 7. Make sure same box can't be played

=end

