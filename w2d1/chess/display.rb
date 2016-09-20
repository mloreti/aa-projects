require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],board)
  end

  def render
    system "clear"
    puts "   #{(0..7).to_a.join("  ")}"
    @board.grid.each_with_index do |row, i|
      # puts "#{i} #{row.join(" ")}"
      puts "#{i} #{row.map.with_index do |piece,j|
        if [i,j] == @cursor.cursor_pos
          " #{piece.to_s} ".colorize(:color => piece.color, :background => :red)
        else
          if (i+j).even?
            " #{piece.to_s} ".colorize(:color => piece.color, :background => :light_yellow)
          else
            " #{piece.to_s} ".colorize(:color => piece.color, :background => :light_black)
          end
        end
      end.join("")}"
    end
    # sleep(2)
  end

end
