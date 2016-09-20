require_relative "board"
require_relative "display"
require_relative "piece"
require_relative "player"

class Chess
  def initialize(player1_name,player2_name)
    @player1 = Player.new(player1_name,:w)
    @player2 = Player.new(player2_name,:b)
    @current_player = @player1
    @board = Board.new.place_pieces
  end

  def play
    until @board.check_mate?
      Display.new(@board).render
      @current_player.play_turn
      switch_player
    end
  end

  def switch_player
    @current_player == @player1 ? @player2 : @player1
  end

end
