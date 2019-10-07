class Board
  def initalize
    # self.create
  end
  
  def self.create
    @arr = []
    # >>> This creates the board and marks every grid with a number 1 - 9
    for i in 1..9
      @arr.push(" [ #{i} ] ").each_slice(3)
    end
    @arr.each_slice(3) { |x| puts x.join puts}
    @arr
  end

end