require "./cell"

class Game
  attr_accessor :size, :board

  def initialize
    @size = get_board_size
    @board = setup_board_with(@size)
  end

  def tick
    @board.each_with_index do |row|
      row.each do |cell|
        @board[cell.x][cell.y].is_alive? if cell.neighbours_present?
      end
    end
    display_board
  end


  private

  def get_board_size
    puts "Please enter a board size: "
    @size = gets.to_i
  end

  def setup_board_with(size)
    x, y = spawn
    Array.new(@size) { Array.new(@size) { Cell.new(x, y, self) }}
  end

  def display_board
    puts "Output"
    @board.map {|row| row.join(" ")}.join("\n")
  end

  def spawn
    puts "Seed X:"
    x = gets.to_i
    puts "Seed Y:"
    y = gets.to_i
    return x, y
  end



end

@game = Game.new
puts @game.tick