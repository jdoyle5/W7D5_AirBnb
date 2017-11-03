class Game
require_relative 'board.rb'
require_relative 'player.rb'

  def initialize(player1)
    @player = player1
    @board = Board.new
    @board.populate
    @previous_guess = nil

  end

  def play
    until @board.won?
      system("clear")
      @board.render
      take_turn
      @previous_guess = nil
    end

    p "You have won!"
  end

  def take_turn
    @previous_guess = @player.make_guess(@board).flatten
    @board.reveal(@previous_guess)
    @board.render
    guess2 = @player.make_guess(@board).flatten
    @board.reveal(guess2)
    @board.render
    sleep(2)
    if @board[@previous_guess] != @board[guess2]
      @board[@previous_guess].orientation = :down
      @board[guess2].orientation = :down
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  player = ComputerPlayer.new
  game = Game.new(player)
  game.play
end
