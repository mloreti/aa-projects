require_relative 'piece'
require_relative 'steppable'

class King < Piece
  include SteppingPiece

  def initialize(pos,color,board)
    @symbol = :K
    super
  end

  def moves_dir
    horizontal_dir + diagonal_dir
  end

end
