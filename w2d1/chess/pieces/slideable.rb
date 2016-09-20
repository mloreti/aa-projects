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

  def valid_moves
    array = self.moves
    result = []
    array.each do |dir|
      dir.each do |pos|
        square = @board[pos]
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
