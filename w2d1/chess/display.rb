require "colorize"
require_relative "cursor"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],board)
  end

  def render
    puts "  #{(0..7).to_a.join(" ")}"
    @board.grid.each_with_index do |row, i|
      # puts "#{i} #{row.join(" ")}"
      puts "#{i} #{row.map.with_index do |piece,j|
        if [i,j] == @cursor.cursor_pos
          " ".colorize(:background => :red)
        else
          " ".colorize(:background => :green)
        end
      end.join(" ")}"
    end
  end

end
