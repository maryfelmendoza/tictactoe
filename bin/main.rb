require_relative  '../lib/game.rb'
puts
puts "*" * 27
puts "  WELCOME TO TIC-TAC-TOE!"
puts "*" * 27
puts
print "Player 1, What is your name?: "
player1 = gets.chomp.capitalize
print "Now, Player 2, What is your name?: "
player2 = gets.chomp.capitalize
puts
puts "Let's play! #{player1} and #{player2}!!"
puts


game = Game.new(player1, player2)
ct = 0
loop do
  loop do
    puts
    print "Pick a box to play #{player1}! > "
    box = gets.chomp.to_i
    if game.cheater?(box) == false
      game.play(player1, box)
      break
    else
      puts "That has been played already!"
    end
  end
  break if game.game_over[0] == true

  loop do
    print "It's your turn to pick #{player2} > "
    box = gets.chomp.to_i
    if game.cheater?(box) == false
      game.play(player2, box)
      break
    else
      puts "That has been played already!"
    end
  end
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

