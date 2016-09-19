class KnightPathFinder
  def self.valid_moves(position)
    deltas = [
      [-2, -1],
      [-1, -2],
      [-2, 1],
      [-1, 2],
      [1, -2],
      [2, -1],
      [1, 2],
      [2, 1]
    ]
    moves = []
    deltas.each do |delta|
      x = position.row + delta.first
      y = position.column + delta.last
      next unless (0..8).to_a.include?(x) && (0..8).to_a.include?(y)
      moves << Coordinates.new(x, y)
    end
    moves
  end

  def initialize(position)
    @position = position
    @visited_positions = Hash.new { |h, v| h[v] = false }
    @visited_positions[position] = nil
  end

  def build_move_tree
    possible_moves = new_move_positions(@position)
    until possible_moves.empty?
      move = possible_moves.pop
      possible_moves += new_move_positions(move)
    end
  end

  def find_path(target)
    build_move_tree
    path = [target]
    parent = @visited_positions[target]
    until parent.nil?
      path.unshift(parent)
      parent = @visited_positions[parent]
    end
    path.map { |pos| [pos.row, pos.column] }
  end

  private

  def new_move_positions(position)
    moves = self.class.valid_moves(position).reject { |pair| @visited_positions.has_key?(pair) }
    moves.each { |move| @visited_positions[move] = position }
    moves
  end
end

class Coordinates < Struct.new(:row, :column)
end

start = Coordinates.new(0, 0)
kpf = KnightPathFinder.new(start)

end_one = Coordinates.new(2, 1)
end_two = Coordinates.new(3, 3)
p kpf.find_path(end_one) # => [[0, 0], [2, 1]]
p kpf.find_path(end_two) # => [[0, 0], [2, 1], [3, 3]]
