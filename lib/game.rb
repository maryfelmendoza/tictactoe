
class Game 
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_played = []
    @player2_played = []
    @board_array = []
    @box_played = []
    @current_player = 1
    @winning_combos= [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
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
        puts "Choose a number between 1-9 #{@player1}"
        @player1_input = gets.chomp.to_i
        if @box_played.include? @player1_input
          puts "PICK SOMETHING ELSE YOU CHEATER"
        else
          @player1_played.push(@player1_input)
          @box_played.push(@player1_input)
          @board_array[@player1_input - 1] = " [ X ] "
          puts @board_array.each_slice(3) { |x| puts x.join puts}
          @current_player = 2
          self.game_over?
        end
      elsif @current_player == 2
        puts "Choose a number between 1-9 #{@player2}"
        @player2_input = gets.chomp.to_i
        if @box_played.include? @player2_input
          puts "PICK SOMETHING ELSE YOU CHEATER"
        else
          @player2_played.push(@player2_input)
          @box_played.push(@player2_input)
          @board_array[@player2_input - 1] = " [ O ] "
          puts @board_array.each_slice(3) { |x| puts x.join puts}
          @current_player = 1
          self.game_over?
        end
      end
      ct += 1
    end
  end

  def test
    if @current_player == 1
      puts "Choose a number between 1-9 #{@player1}"
      @player1_input = gets.chomp.to_i
      if @box_played.include? @player1_input
        puts "PICK SOMETHING ELSE YOU CHEATER"
      else
        @player1_played.push(@player1_input)
        @box_played.push(@player1_input)
        @board_array[@player1_input - 1] = " [ X ] "
        puts @board_array.each_slice(3) { |x| puts x.join puts}
        @current_player = 2
        self.game_over?
      end
    end
  end

  def game_over?
    for i in 0...@winning_combos.length
      if (@winning_combos[i] - @player1_played).empty?
        puts "YOU WON PLAYER ONE!"
        exit
      elsif (@winning_combos[i] - @player2_played).empty?
        puts "YOU WON PLAYER TWO!"
        exit
      end
    end
  end
end