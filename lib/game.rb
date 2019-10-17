# frozen_string_literal: true

class Game
  X_SYM = :X
  O_SYM = :O

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  private

  def win_rows(board)
    win_row1 = [board[0], board[1], board[2]]
    win_row2 = [board[3], board[4], board[5]]
    win_row3 = [board[6], board[7], board[8]]
    [win_row1, win_row2, win_row3]
  end

  def win_columns(board)
    win_col1 = [board[0], board[3], board[6]]
    win_col2 = [board[1], board[4], board[7]]
    win_col3 = [board[2], board[5], board[8]]
    [win_col1, win_col2, win_col3]
  end

  def win_diagonals(board)
    win_diagonal1 = [board[0], board[4], board[8]]
    win_diagonal2 = [board[2], board[4], board[6]]
    [win_diagonal1, win_diagonal2]
  end

  def combos(board)
    winner = false
    win_rows(board).each do |win_row|
      next unless win_row.all?(X_SYM) || win_row.all?(O_SYM)

      winner = win_row
    end
    win_columns(board).each do |win_col|
      next unless win_col.all?(X_SYM) || win_col.all?(O_SYM)

      winner = win_col
    end
    win_diagonals(board).each do |win_diagonal|
      next unless win_diagonal.all?(X_SYM) || win_diagonal.all?(O_SYM)

      winner = win_diagonal
    end
    winner
  end

  public

  def winner(board)
    arr = [1]
    arr = combos(board) if combos(board)

    if arr.all?(X_SYM)
      1
    elsif arr.all?(O_SYM)
      2
    end
  end
end
