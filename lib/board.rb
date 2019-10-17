class Board
  
  X_SYM = :X
  O_SYM = :O

  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  private

  def check_index(index)
    if @board[index] == X_SYM || @board[index] == O_SYM
      false
    else
      true
    end
  end

  def valid_element (element)
    if element.to_i >= 0 && element.to_i < 9
      true
    else
      false
    end
  end

  public

  def display_board
    row_1 = " [#{@board[0]}] [#{@board[1]}] [#{@board[2]}] "
    row_2 = " [#{@board[3]}] [#{@board[4]}] [#{@board[5]}] "
    row_3 = " [#{@board[6]}] [#{@board[7]}] [#{@board[8]}] "

    row_1 + row_2 + row_3
  end

  def set_index(index, player)
    
    index -= 1
    
    if valid_element(index)
      
      if check_index(index)
        @board[index] = player == 1 ? X_SYM : O_SYM
        true
      else
        false
      end

    else

      false

    end
    
  end

end