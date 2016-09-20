require_relative 'piece'
require_relative 'slideable'

class Pawn < Piece
  include SlidingPiece
  attr_accessor :starting_pos

  def initialize(pos,color,board)
    @starting_pos = true
    @symbol = :P
    super
  end

  def moves
    deltas = [
      [[1,0]],
      [[1,1]],
      [[1,-1]]
    ]
    deltas[0] << [2,0] if @starting_pos
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

  def valid_moves
    array = self.moves
    result = []
    array.first.each do |pos|
      square = @board[pos]
      if square.color.nil?
        result << pos
      else
        if square.color == self.color
          break
        else
          result << pos
          break
        end
      end
    end
    [array[-1].first, array[-2].first].each do |pos|
      next if pos.nil?
      # debugger if pos.nil?
      square = @board[pos]
      result << pos if square.color != self.color && !(square.color.nil?)
    end
    result
  end

  def color_direction(color)
    color == :white ? -1 : 1
  end

end
