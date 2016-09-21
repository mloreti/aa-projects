require_relative "display"
require_relative "piece"

require 'byebug'

class Board
  attr_accessor :grid, :piece_on_board
  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    @piece_on_board = []
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,val)
    x,y = pos
    @grid[x][y] = val
  end

  def move(start_pos, end_pos)
    # debugger
    unless has_piece?(start_pos) && valid_move?(start_pos, end_pos)
      raise ArgumentError.new "Invalid move"
    end
    # debugger
    one_piece = self[start_pos]
    if one_piece.is_a?(Pawn)
      one_piece.starting_pos = false
    end
    self[start_pos] = NullPiece.instance
    self[end_pos] = one_piece

  rescue ArgumentError => e
    puts "\nPlease try again".red
    puts "Error message: #{e.message}".red
    sleep(2)
    # retry
  end

  def in_bounds?(x,y)
    (0..7).include?(x) && (0..7).include?(y)
  end

  def has_piece?(start_pos)
    !self[start_pos].is_a?(NullPiece)
  end

  def valid_move?(start_pos, end_pos)
    self[start_pos].valid_moves.include?(end_pos)
  end

  def place_pieces
    rows = [[Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook], Array.new(8) { Pawn }]
    rows.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        @grid[i][j] =  piece.new([i,j], :black, self)
        @piece_on_board << @grid[i][j]
      end
    end
    rows = [[Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook], Array.new(8) { Pawn }]
    rows.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        @grid[7 - i][j] =  piece.new([7-i,j], :white, self)
        @piece_on_board << @grid[7 - i][j]
      end
    end
  end

  def in_check?(color)
    pos_of_king = @piece_on_board.select {|piece| piece.color == color && piece.to_s == "K"}.first.pos
    oppo_piece = @piece_on_board.select {|piece| piece.color != color }
    oppo_moves = []
    oppo_piece.each do |piece|
       oppo_moves += piece.valid_moves
    end
    oppo_moves.include?(pos_of_king)
  end

  def check_mate?(color)
    self_pieces = @piece_on_board.select { |piece| piece.color == color }
    self_moves = []
    self_pieces.each do |piece|
      piece.valid_moves.each do |valid_move|
        self_moves << [piece.pos, valid_move]
      end
    end
    self_moves.all? { |move| move_into_check?(move, color) }
  end

  def move_into_check?(piece_move, color)
    # debugger
    fake_move(piece_move.first, piece_move.last)
    result = in_check?(color)
    fake_move(piece_move.last, piece_move.first)
    result
  end

  def fake_move(start_pos, end_pos)
    piece = self[start_pos]
    self[start_pos] = NullPiece.instance
    self[end_pos] = piece

  end

end


# b = Board.new
# b.place_pieces
# d = Display.new(b)
# b.move([3,0],[3,0])
# p b.grid[3][0].class
#
# # loop do
# #   d.render
# # end
