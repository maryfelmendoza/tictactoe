# frozen_string_literal: true

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_played = []
    @player2_played = []
    @board_array = []
    @box_played = []
    @current_player = 1
    @count = 0
    @result
  end

  def board
    (1..9).each do |i|
      @board_array.push(" [ #{i} ] ").each_slice(3)
    end
    @board_array.each_slice(3) { |x| puts x.join puts }
  end

  def play(player, box)
    board
    box
    if player == @player1
      player_played = @player1_played
    else
      player_played = @player2_played
    end
    check(player, player_played, box)
  end

  def check(player, player_played, box)
    player_played.push(box)
    puts "Sup #{player}, so far you got #{player_played}"
    @winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    (0...@winning_combos.length).each do |i|
      if (@winning_combos[i] - player_played).empty?
        puts "YOU WON #{player.upcase}!!"
        @result = true
        break
      elsif @box_played.length == 9
        puts "IT'S A TIE"
        @result = true
        break
      else 
        puts 'KEEP PLAYING!'
        @result = false
        break
      end
    end
  end
  
  def game_over?
    @result
  end

end
