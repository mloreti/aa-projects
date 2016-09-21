require_relative "board"
require_relative "display"
require_relative "piece"
require_relative "player"

class Chess
  def initialize(player1_name,player2_name)
    @player1 = Player.new(player1_name,:white)
    @player2 = Player.new(player2_name,:black)
    @current_player = @player1
    @board = Board.new
    @board.place_pieces
    @display = Display.new(@board)
  end

  def play
    loop do
      @display.render
      result = @current_player.play_turn(@display)
      # debugger
      @board.move(result[0], result[1])
      break if @board.check_mate?(@current_player.color)
      switch_player
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

end
chess = Chess.new("Fan", "Mickey")
chess.play
