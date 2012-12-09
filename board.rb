require_relative "cell"

class Board

  attr_accessor :rows, :cols, :cells

  def initialize(rows, cols)
    @rows  = rows
    @cols  = cols
    @cells = setup_board
  end

  def seed(*args)
    args.each {|x, y| cells[x][y].live! }
  end

  def tick!
    to_live = []
    to_die  = []
    
    cells.each do |row|
      row.each do |cell|
        if cell.alive?
          if cell.neighbour_count < 2 || cell.neighbour_count > 3
            to_die.push(cell)
          elsif cell.neighbour_count == 2 || cell.neighbour_count == 3
            to_live.push(cell)
          end

        else
          to_live.push(cell) if cell.neighbour_count == 3
        end
      end
    end
    
    to_live.each {|cell| cell.live!}
    to_die.each  {|cell| cell.die!}
  end

  
  private

  def setup_board
    Array.new(@rows) do |x|
      Array.new(@cols) do |y|
        Cell.new(x, y, self)
      end
    end
  end

end
