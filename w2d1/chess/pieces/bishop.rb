require_relative 'piece'
require_relative 'slideable'

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
