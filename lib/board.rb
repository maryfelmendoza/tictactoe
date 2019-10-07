class Board
  def initialize
    # self.create
  end
  def self.create
    @arr = []
    # >>> This creates the board and marks every grid with a number 1 - 9
    for i in 1..9
      @arr.push(" [ #{i} ] ").each_slice(3)
    end
      @display_board = @arr.each_slice(3) { |x| puts x.join puts}
    # @arr
  end
end