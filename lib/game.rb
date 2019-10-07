
class Game 
  attr_accessor :board
  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end
  
  def play 
    count = 0
    # While nobody has won
    while count < 3
      board.create
      puts "Choose a number between 1-9 #{@player1}"
      @player1_input = gets.chomp.to_i
      
      # Make sure user has the correct input
      if @player1_input.is_a?(Integer) && @player1_input > 0 && @player1_input <= 9
        puts "#{@player2} now its your turn, choose a number between 1-9"
        @player2_input = gets.chomp
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
    end

    # Congratulate winner
    puts "YOU WON #{@player1}!!!"
  end

end