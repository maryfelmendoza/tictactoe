
class Game 
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_played = []
    @player2_played = []
    @arr = []
    @display_board
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
      @current_player = 1
      if @current_player == 1
      puts "Choose a number between 1-9 #{@player1}"
      @player1_input = gets.chomp.to_i
      @player1_played.push(@player1_input)

      @arr[@player1_input - 1] = " [ X ] "
      puts @arr.each_slice(3) { |x| puts x.join puts}
      @current_player=2
      else @current_player == 2
      puts "Choose a number between 1-9 #{@player2}"
      @player2_input = gets.chomp.to_i
      @player2_played.push(@player2_input)

      @arr[@player2_input - 1] = " [ O ] "
      puts @arr.each_slice(3) { |x| puts x.join puts}
      end
      # Make sure user has the correct input

=begin
      if @player1_input.is_a?(Integer) && @player1_input > 0 && @player1_input <= 9
        puts "#{@player2} now its your turn, choose a number between 1-9"
        @player2_input = gets.chomp
      board.create
        if @player2_input.is_a?(Integer) && @player2_input > 0 && @player2_input <= 9
          puts "#{@player1} now its your turn, choose a number between 1-9"
        else
          # If player 2 has wrong input
          puts "FOLLOW THE RULES"
        end
      else
          # If player 1 has wrong input
        puts "YOU GOTTA PUT IN SOMETHING RIGHT"
      end
      count +=1

    # Congratulate winner
    puts "YOU WON #{@player1}!!!"
=end
  end

end