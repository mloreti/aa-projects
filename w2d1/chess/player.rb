require_relative "display"

class Player
  attr_reader :color
  def initialize(name,color)
    @name = name
    @color = color
  end

  def play_turn(display)
    # debugger
    start_pos = nil
    while start_pos.nil?
      display.render
      puts "#{@name}'s' turn. Color: #{@color}"
      print "Start Position: "
      print display.cursor.cursor_pos
      start_pos = display.cursor.get_input
    end
    end_pos = nil
    while end_pos.nil?
      display.render
      puts "#{@name}'s' turn. Color: #{@color}"
      puts "Start Position: #{start_pos}"
      print "End position: "
      print display.cursor.cursor_pos
      end_pos = display.cursor.get_input
    end
    [start_pos, end_pos]
  end

end
