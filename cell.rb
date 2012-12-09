class Cell

  attr_accessor :x, :y , :board

  def initialize(x=0, y=0, board)
    @board = board
    @x     = x
    @y     = y
    @alive = false
  end

  def live!
    @alive = true
  end

  def die!
    @alive = false
  end

  def dead?
    !@alive
  end

  def alive?
    !dead?
  end

  def neighbour_count
    neighbours.count
  end


  private

  def alive_neighbours
    cells = []
    board.cells.each do |row|
      row.each do |cell|
        cells << cell if cell.alive?
      end
    end
    cells
  end
  
 
  def neighbours
    ### Blehhh!! LOOKS UGLY NEED TO REFACTOR 
    neighbours = []
    alive_neighbours.each do |cell|
      if self.x == cell.x && self.y == cell.y - 1 # To the north
        neighbours << cell
      elsif self.x == cell.x && self.y == cell.y + 1 # To the south
        neighbours << cell
      elsif self.x == cell.x - 1 && self.y == cell.y + 1 # To the north east
        neighbours << cell
      elsif self.x == cell.x - 1 && self.y == cell.y - 1 # To the north west
        neighbours << cell
      elsif self.x == cell.x + 1 && self.y == cell.y - 1 # To the south west
        neighbours << cell
      elsif self.x == cell.x + 1 && self.y == cell.y + 1 # To the south east
        neighbours << cell
      elsif self.x == cell.x - 1 && self.y == cell.y # to east
        neighbours << cell
      elsif self.x == cell.x + 1 && self.y == cell.y # to west
        neighbours << cell
      end
    end
    neighbours
  end
  

end
