require_relative 'piece'
require_relative 'slideable'

class Pawn < Piece
  include SlidingPiece

  def initialize(pos,color,board)
    @starting_pos = true
    @symbol = :P
    super
  end

  def moves
    deltas = [
      [[0, 1]],
      [[1,1]],
      [[-1,1]]
    ]
    deltas[0] << [0,2] if @starting_pos
    possible_moves = []

    deltas.each do |dir|
      sub_arr = []
      dir.each do |delta|
      # debugger
        x = @pos[0] + (delta[0] * color_direction(@color))
        y = @pos[1] + (delta[1] * color_direction(@color))
        square = [x, y]
        sub_arr<< square if @board.in_bounds?(x,y)
      end
      possible_moves << sub_arr
    end
    possible_moves
  end

  def color_direction(color)
    color == :w ? -1 : 1
  end

end
