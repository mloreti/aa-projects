require_relative "display"
require_relative "piece"
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) { [] } }
    # place_pieces
  end

  def move(start_pos, end_pos)
    if has_piece?(start_pos) || valid_move?(start_pos, end_pos)
      raise ArgumentError.new "Invalid move"
    end

  rescue ArgumentError => e
    puts "Please try again"
    puts "Error message: #{e.message}"
    retry
  end

  def in_bounds?(x,y)
    (0..7).include?(x) && (0..7).include?(y)
  end
end

board = Board.new
b = Queen.new([4,4],:w,board)
p b.moves
