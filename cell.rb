class Cell

  attr_accessor :x, :y , :board, :neighbours

  def initialize(x=0, y=0, board)
    @board = board
    @x     = x
    @y     = y
    @alive = false
  end

  def live!
    @alive = true
  end

  def dead!
    @alive = false
  end

  def dead?
    !@alive
  end

  def alive?
    !dead?
  end

end
