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

  KNIGHT_DIRS = [
    [-2, -1],
    [-1, -2],
    [-2, 1],
    [-1, 2],
    [1, -2],
    [2, -1],
    [1, 2],
    [2, 1]
  ]

  def diagonal_dir
    DIAGONAL_DIRS
  end

  def horizontal_dir
    HORIZONTAL_DIRS
  end

  def knight_dir
    KNIGHT_DIRS
  end

  def moves
    possible_moves = []
    dirs = self.moves_dir
    dirs.each do |diff|
      x = @pos.first + diff.first
      y = @pos.last + diff.last
      if @board.in_bounds?(x,y)
        possible_moves << [x,y]
      end
    end
    possible_moves
  end

  def valid_moves(array)
    result = []
    array.each do |pos|
      square = @board[pos[0], pos[1]]
      if square.nil?
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
    result
  end
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
      sub_array = []
      7.times do
      # debugger
      if sub_array.empty?
        base = @pos
      else
        base = sub_array.last
      end
        x = base.first + diff.first
        y = base.last + diff.last
        if @board.in_bounds?(x,y)
          sub_array << [x,y]
        end
      end
      possible_moves += [sub_array]
    end
    possible_moves
  end

  def valid_moves(array)
    result = []
    array.each do |dir|
      dir.each do |pos|
        square = @board[pos[0], pos[1]]
        if square.nil?
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
      result
    end
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

class Pawn < Piece

  def initialize(pos,color,board)
    @starting_pos = true
    @symbol = :P
    super
  end

  def moves_dir
    knight_dir
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

  def valid_moves(array)
    result = []
    array.each do |dir|
      dir.each do |pos|
        square = @board[pos[0], pos[1]]
        if square.nil?
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
      result
    end
  end

  def color_direction(color)
    color == :w ? -1 : 1
  end

end
