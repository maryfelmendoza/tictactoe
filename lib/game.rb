# frozen_string_literal: true

class Game
  def initialize
    @player1_played = []
    @player2_played = []
    @board_array = []
    @box_played = []
    @game_played = []
    @ans = false
  end

  def board
    (1..9).each do |i|
      @board_array.push(" [ #{i} ] ").each_slice(3)
    end
    @board_array
  end

  def cheater?(box)
    @ans = false
    if @game_played.include?(box)
      @ans = true
    else
      @game_played.push(box)
    end
    @ans
  end

  def play(player, box, current_player)
    if current_player == 1
      player_played = @player1_played
      sym = 'X'
    elsif current_player == 2
      player_played = @player2_played
      sym = 'O'
    end
    player_played.push(box)
    @box_played.push(box)
    check(player, player_played, box, sym)
  end

  def check(player, player_played, box, sym)
    @winning_combos = [[1, 5, 9], [3, 5, 7], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
    (0...@winning_combos.length).each do |i|
      if (@winning_combos[i] - player_played).empty?
        @announce = "YOU WON #{player.upcase}!!"
        @result = true
        break
      elsif @box_played.length == 9 && (@winning_combos[i] - player_played).size.positive?
        @announce = "IT'S A TIE"
        @result = true
      else
        @result = false
      end
    end
    @board_array[box - 1] = " [ #{sym} ] "
  end

  def display_board
    @board_array
  end

  def game_over
    [@result, @announce]
  end
end
