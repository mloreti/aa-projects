require "byebug"
class Piece
  def initialize(pos,color,board)
    @pos = pos
    @color = color
    @board = board
  end

  def to_s
    @symbol.to_s
  end
end

class NullPiece
  # include Singleton

end

module SteppingPiece

end

module SlidingPiece
  DIAGONAL_DIRS = [
    [-1, 1],
    [-1, -1],
    [1, 1],
    [1, -1]
  ]

  HORIZONTAL_DIRS = [
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0]
  ]

  def diagonal_dir
    DIAGONAL_DIRS
  end

  def horizontal_dir
    HORIZONTAL_DIRS
  end

  def moves
    possible_moves = []
    dirs = self.moves_dir
    dirs.each do |diff|
      7.times do
      # debugger
      if possible_moves.empty?
        base = @pos
      else
        base = possible_moves.last
      end
        x = base.first + diff.first
        y = base.last + diff.last
        if @board.in_bounds?(x,y)
          possible_moves << [x,y]
        end
      end
    end
    possible_moves
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(pos,color,board)
    @symbol = :B
    super
  end

  def moves_dir
    diagonal_dir
  end

end

class Queen < Piece
  include SlidingPiece

  def initialize(pos,color,board)
    @symbol = :Q
    super
  end

  def moves_dir
    diagonal_dir + horizontal_dir
  end

end
