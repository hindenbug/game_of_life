require "spec_helper"
require "./cell"

describe Cell do

  let(:board) { Board.new(4,4) }
  let(:cell)  { Cell.new(board) }

  it "should belong to a board" do
    cell.board.should eql board
  end

  it "should spawn a new life at given locations" do
    cell = Cell.new(3, 3, board)
    cell.x.should eql 3
    cell.y.should eql 3
  end

  it "should be dead by default" do
    cell.should be_dead
    cell.should_not be_alive
  end

  describe ".live!" do
    before { cell.live! }

    it "should be alive" do
      cell.should be_alive
      cell.should_not be_dead
    end
  end

  describe ".dead!" do
    before { cell.live! }

    it "should be dead" do
      cell.dead!
      cell.should be_dead
      cell.should_not be_alive
    end
  end

  describe ".neighbours" do
    
  end

end
