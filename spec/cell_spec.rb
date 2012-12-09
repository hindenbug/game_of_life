require "spec_helper"
require "./cell"
require "./board"

describe Cell do

  let(:board) { Board.new(4,4) }
  let(:cell)  { Cell.new(board) }
  let(:cells) { board.cells }

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

  describe ".die!" do
    before { cell.live! }

    it "should be dead" do
      cell.die!
      cell.should be_dead
      cell.should_not be_alive
    end
  end

  describe "neighbours" do
    before do
      @cell = Cell.new(3,3, board)
      cells[3][3].live!
      cells[2][2].live!
      cells[3][2].live!
      cells[2][3].live!
      cells[1][1].live!
    end

    it "should return neighbours" do
      @cell.neighbour_count.should == 3
    end

  end

end
