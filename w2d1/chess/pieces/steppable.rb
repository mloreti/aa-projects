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

  def valid_moves
    array = self.moves
    result = []
    array.each do |pos|
      next if pos.nil?
      square = @board[pos]
      if square.nil?
        result << pos
      else
        # debugger
        if square.color == self.color
          next
        else
          result << pos
          next
        end
      end
    end
    result
  end
end
