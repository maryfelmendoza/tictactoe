# Set up game
puts "Welcome!"
puts "Player 1, What is your name?"
@player1 = gets.chomp
puts "Now, Player 2, What is your name?"
@player2 = gets.chomp
puts "Let's play! #{@player1} #{@player2}"
continue_game = true

# While nobody has won
while continue_game
  # get input from player 1
  puts "Choose a number between 1-9 #{@player1}"
  @player1_input = gets.chomp.to_i
  # Make sure user has the correct input
  if @player1_input.is_a?(Integer) && @player1_input > 0 && @player1_input <= 9
    print "Player one, you have input #{@player1_input}"
    puts
    puts "Have you won? press 'y' for yes and 'n' for no 't' for tie"
    ans = gets.chomp
    if ans == 'y'
      continue_game = false
      break
    elsif ans == 't'
      puts 'IT IS A TIE'
      break
    end
  else
      # If player 1 has wrong input
    puts "YOU GOTTA PUT IN SOMETHING RIGHT"
  end

  puts "HERE IS YOUR BOARD RIGHT HERE."

  puts "Choose a number between 1-9 #{@player2}"
  @player2_input = gets.chomp.to_i
  if @player2_input.is_a?(Integer) && @player2_input > 0 && @player2_input <= 9
    puts "#{@player2} now its your turn, choose a number between 1-9"
    puts
    puts "Have you won? press 'y' for yes and 'n' for no 't' for tie"
    ans = gets.chomp
    if ans == 'y'
      continue_game = false
      break
    elsif ans == 't'
      puts 'IT IS A TIE'
      break
    end
  else
    # If player 2 has wrong input
    puts "FOLLOW THE RULES"
  end

  puts "HERE IS YOUR BOARD RIGHT HERE."
  
end



