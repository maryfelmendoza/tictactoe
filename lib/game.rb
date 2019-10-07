class Game 
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_played = []
    @player2_played = []
    @board_array = []
    @box_played = []
    @current_player = 1
    @winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end
  def board
    # >>> This creates the board and marks every grid with a number 1 - 9
    for i in 1..9
      @board_array.push(" [ #{i} ] ").each_slice(3)
    end
      return @board_array.each_slice(3) { |x| puts x.join puts}
  end
  def play 
    # While nobody has won
    ct = 0
    self.board
    while ct < 9
      if @current_player == 1
        player_input = @player1_input
        player_played = @player1_played
        player = @player1
        sym = 'X'
        @current_player = 2
        self.run(player_input, player_played, player, sym)
      elsif @current_player == 2
        player_input = @player2_input
        player_played = @player2_played
        player = @player2
        sym = 'O'
        @current_player = 1
        self.run(player_input, player_played, player, sym)
      end
      ct += 1
    end
  end

  def run(player_input, player_played, player, sym)
      puts "Choose a number between 1-9 #{player}"
      player_input = gets.chomp.to_i
      if @box_played.include? player_input
        puts "PICK SOMETHING ELSE YOU CHEATER"
      else
        player_played.push(player_input)
        @box_played.push(player_input)
        @board_array[player_input - 1] = " [ #{sym} ] "
        puts @board_array.each_slice(3) { |x| puts x.join puts}
        self.game_over?
      end
    end

  def game_over?
    for i in 0...@winning_combos.length
      if (@winning_combos[i] - @player1_played).empty?
        puts "YOU WON PLAYER ONE!"
        @winner = @player1
        exit
      elsif (@winning_combos[i] - @player2_played).empty?
        puts "YOU WON PLAYER TWO!"
        @winner = @player2
        exit
      end
    end
    if @winner == nil 
      puts "YOU'RE BOTH LOSERS!"
    end
  end
end