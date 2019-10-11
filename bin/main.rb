require_relative  '../lib/game.rb'

puts
puts "*" * 27
puts "  WELCOME TO TIC-TAC-TOE!"
puts "*" * 27
puts

def name(player)
  print "#{player}, What is your name?: "
  player = gets.chomp.capitalize
  player
end

player1 = name("Player 1")
player2 = name("Player 2")

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