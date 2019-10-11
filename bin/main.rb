require_relative  '../lib/game.rb'

puts
puts "*" * 27
puts "  WELCOME TO TIC-TAC-TOE!"
puts "*" * 27
puts

def name(player)
  loop do
    print "#{player}, What is your name?: "
    player = gets.chomp.capitalize
  break if !player.empty? 
    puts "You gotta give us a name buddy"
  end
  player
end

$player1 = name("Player 1")
$player2 = name("Player 2")
@game = Game.new

  current_player = 1
  loop do
    if current_player == 1 
      n = 1
      player = $player1
      current_player = 2
    else
      n = 2
      player = $player2
      current_player = 1
    end
    loop do
      puts
      print "Pick a box to play #{player}! > "
      box = gets.chomp.to_i
      if !box.between?(1, 9)
        puts
        print "Please input a number between 1 and 9"
        puts
      else
        if @game.cheater?(box) == false
          @game.play(player, box, n)
          break
        else
          puts "That has been played already!"
        end
      end
    end
    break if @game.game_over[0] == true
  end

if @game.game_over[0] == true
  puts "GAME OVER #{@game.game_over[1]}!"
end