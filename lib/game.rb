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
    @announce
    board
  end

  def board
    (1..9).each do |i|
      @board_array.push(" [ #{i} ] ").each_slice(3)
    end
    @board_array.each_slice(3) { |x| puts x.join puts }
  end

  def play(player, box)
    box
    if player == @player1
      player_played = @player1_played
      sym = "X"
    else
      player_played = @player2_played
      sym = "O"
    end
    check(player, player_played, box, sym)
  end

  def check(player, player_played, box, sym)
    player_played.push(box)
    @winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    (0...@winning_combos.length).each do |i|
      if (@winning_combos[i] - player_played).empty?
        @announce = "YOU WON #{player.upcase}!!"
        @result = true
        break
      elsif @box_played.length == 8
        @announce = "IT'S A TIE"
        @result = true
        break
      else 
        @result = false
      end
    end
    @box_played.push(box)
    @board_array[box - 1] = " [ #{sym} ] "
    puts @board_array.each_slice(3) { |x| puts x.join puts }
  end
  
  def game_over
    [@result, @announce]
  end

end
