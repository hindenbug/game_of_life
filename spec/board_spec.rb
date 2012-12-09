require "spec_helper"
require "debugger"
require "./cell"
require "./board"

describe Board do

  let(:board) { Board.new(4,4) }
  let(:cells) { board.cells }

  it "should create board with defined dimensions" do
    board.rows.should eql 4
    board.cols.should eql 4
  end

  it "should have all the cells as dead" do
    cells.each do |row|
      row.each do |cell|
        cell.should be_dead
        cell.should_not be_alive
      end
    end
  end

  describe ".seed" do
    it "should seed the board" do
      board.seed([1,1], [0,3], [3,3], [1,2])
      cells[1][1].should be_alive
      cells[3][3].should be_alive
      cells[0][3].should be_alive
      cells[1][2].should be_alive
    end
  end
  
  describe ".tick!" do
    before do
      board.seed([1,1], [0,3], [3,3])
    end

    it "RULE #1 -> Live Cell with less than 2 live neighbors dies, as if by loneliness." do
      board.tick!
      cells[1][1].should be_dead
      cells[0][3].should be_dead
      cells[1][2].should be_dead
    end

    it "RULE #2 -> Live Cell with 2 or 3 live neightbours lives for next generation " do
      cells[0][0].live!
      cells[2][2].live!
      board.tick!
      cells[1][1].should be_alive
    end

    it "RULE #3 -> Live Cell with more than 3 live neighbours dies from over population" do
      cells[2][3].live!
      cells[2][1].live!
      cells[1][2].live!
      board.tick!
      cells[2][2].should be_dead
    end

    it "RULE #4 -> Dead cell with exactly 3 neighbours comes to life" do
      cells[0][2].live!
      board.tick!
      cells[1][2].should be_alive
    end


  end



end
