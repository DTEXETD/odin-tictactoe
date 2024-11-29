# Responsible to play the actual game, with a board and two players
class Game
  def initialize
    @board = Board.new
    @players = [Player.new("Player 1", "X"), Player.new("Player 2", "O")]
    @current_player = 0
  end

  def play_game
    while game_over?
      @board.show
      currentplayer = @players[@current_player]
      @board.update(currentplayer.mark)
      next_player
    end
  end

  private

  def next_player
    @current_player += 1
    @current_player %= 2
  end

  def game_over?
    true # TO_DO
  end
end