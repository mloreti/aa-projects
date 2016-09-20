
require "singleton"
class Piece
  attr_reader :color, :pos

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
  include Singleton
  attr_reader :color
  def to_s
    " "
  end
end
