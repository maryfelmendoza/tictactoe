
class Game 
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_played = []
    @player2_played = []
    @arr = []
    @display_board
    @current_player = 1
    @winning_combos= [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end
  
  def board
    # >>> This creates the board and marks every grid with a number 1 - 9
    for i in 1..9
      @arr.push(" [ #{i} ] ").each_slice(3)
    end
      @display_board = @arr.each_slice(3) { |x| puts x.join puts}
    # @arr
  end
  
  def play 
    puts self.board
    # While nobody has won
      if @current_player == 1
        puts "Choose a number between 1-9 #{@player1}"
        @player1_input = gets.chomp.to_i
        @player1_played.push(@player1_input)
        @arr[@player1_input - 1] = " [ X ] "
        puts @arr.each_slice(3) { |x| puts x.join puts}

        self.game_over?
        @current_player = 2
      end
      if @current_player == 2
        puts "Choose a number between 1-9 #{@player2}"
        @player2_input = gets.chomp.to_i
        @player2_played.push(@player2_input)

        @arr[@player2_input - 1] = " [ O ] "
        puts @arr.each_slice(3) { |x| puts x.join puts}
      end
  end

  def game_over?
    if @player1_played == @winning_combos[i]
      puts "YOU WON PLAYER ONE!"
      exit
    elsif @player2_played == @winning_combos[i]
      puts "YOU WON PLAYER TWO!"
      exit
    else
      self.play
    end
  end
end