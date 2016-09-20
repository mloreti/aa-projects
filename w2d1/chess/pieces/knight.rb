require_relative 'piece'
require_relative 'steppable'

class Knight < Piece
  include SteppingPiece

  def initialize(pos,color,board)
    @symbol = :N
    super
  end

  def moves_dir
    knight_dir
  end

end
