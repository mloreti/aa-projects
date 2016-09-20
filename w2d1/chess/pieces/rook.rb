require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include SlidingPiece

  def initialize(pos,color,board)
    @symbol = :R
    super
  end

  def moves_dir
    horizontal_dir
  end

end
