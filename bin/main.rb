require_relative  '../lib/game.rb'
require_relative '../lib/player.rb'

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
loop do
  loop do
    puts
    print "Pick a box to play #{player1}! > "
    box = gets.chomp.to_i
    if !box.between?(1, 9)
      puts
      print "Please input a number between 1 and 9"
      puts
    else
      if game.cheater?(box) == false
        game.play(player1, box, 1)
        break
      else
        puts "That has been played already!"
      end
    end
  end
  break if game.game_over[0] == true

  loop do
    puts
    print "It's your turn to pick #{player2} > "
    box = gets.chomp.to_i
    if !box.between?(1, 9)
      puts
      print "Please input a number between 1 and 9"
      puts
    else
      if game.cheater?(box) == false
        game.play(player2, box, 2)
        break
      else
        puts "That has been played already!"
      end
    end
  end
  break if game.game_over[0] == true
end

if game.game_over[0] == true
  puts "GAME OVER #{game.game_over[1]}!"
end