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

current_player = 1
player1 = name("Player 1")
player2 = name("Player 2")
$game = Game.new(player1, player2)



def turns(player, n)

  loop do
    loop do
      puts
      print "Pick a box to play #{player}! > "
      box = gets.chomp.to_i
      if !box.between?(1, 9)
        puts
        print "Please input a number between 1 and 9"
        puts
      else
        if $game.cheater?(box) == false
          $game.play(player, box, n)
          break
        else
          puts "That has been played already!"
        end
      end
    end
    break if $game.game_over[0] == true
  end
end

if current_player == 1
  turns(player1, 1)
  current_player = 2
else
  current_player == 2
  turns(player2, 2)
  current_player == 1
end


if game.game_over[0] == true
  puts "GAME OVER #{game.game_over[1]}!"
end