require_relative "display"

class Player
  attr_reader :color
  def initialize(name,color)
    @name = name
    @color = color
  end

  def play_turn(display)
    puts "#{@name} turn"
    puts "start position"
    start_pos = nil
    end_pos = nil
    while start_pos.nil?
      start_pos = display.cursor.get_input
    end
    puts "end position"
    while end_pos.nil?
      end_pos = display.cursor.get_input
    end

  end

end
