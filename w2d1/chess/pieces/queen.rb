require_relative 'piece'
require_relative 'slideable'

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
