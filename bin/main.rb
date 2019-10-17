require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

# welcome info

puts
puts "*" * 27
puts "  WELCOME TO TIC-TAC-TOE!"
puts "*" * 27
puts

puts 'What is your name player 1?'
name_1 = gets.chomp

puts 'What is your name player 2?'
name_2 = gets.chomp

#initialization

player1 = Player.new(name_1, 1)
player2 = Player.new(name_2, 2)
board = Board.new
game = Game.new(player1.name, player2.name)


#game

puts 'Let\'s play!'

count = 0

while count < 9

  puts board.display_board

  if count.even?

    puts 'Choose the number where you want to place your move'
    move_player1 = gets.chomp

    if board.set_index(move_player1.to_i, player1.player_number)
      puts 'Good move!'
      count += 1
    else
      puts 'Invalid move, try again!'
    end

  else

    puts 'Choose the number where you want to place your move'
    move_player2 = gets.chomp

    if board.set_index(move_player2.to_i, player2.player_number)
      puts 'Good move!'
      count += 1
    else
      puts 'Invalid move, try again!'
    end

  end

  win_hash = game.winner(board.board)
    
  if win_hash == 1
      puts
      puts game.player1.to_s.capitalize + ' You are the winner'
      break
  elsif win_hash == 2
      puts
      puts game.player2.to_s.capitalize + ' You are the winner'
      break
  elsif count == 9
      puts
      puts 'It\'s a tie'
  end

end

puts board.display_board

puts 'Game Over!'