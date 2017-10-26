class Ghost

  def initialize(player1, player2, fragment, dictionary)
    @player1 = player1
    @player2 = player2
    @fragment = fragment
    @current_player = player1
    @previous_player = nil
    @dictionary = File.readlines(dictionary).map { |word| word.chomp }
  end

  def play_round
  end

  def current_player
    @current_player
  end

  def next_player!
    if @current_player == @player1
      @current_player = @player2
      @previous_player = @player1
    else
      @current_player = @player1
      @previous_player = @player2
    end
  end

  def previous_player
    @previous_player
  end

  def take_turn(player)
    input = gets.chomp
    if !valid_play?(input)
      raise 'Invalid move! You lose your turn.'
    else
      @fragment = input
    end
    next_player!
  end

  def valid_play?(string)
    @dictionary.any? { |word| word.include?(string) }
  end
end

class Player

  def initialize(name, guess)
    @name = name
    @guess = nil
  end

  def guess
    @guess = gets.chomp
  end

  def alert_invalid_guess
    if @dictionary.include?(@guess) && @guess.include?(Ghost.fragment)
      return true
    else
      raise "Your guess is invalid!"
    end
    false
  end
end

if __FILE__ == $PROGRAM_NAME
  ghost = Ghost.new(player1, player2, nil, 'dictionary.txt')
  player1 = Player.new('player1',nil)
  player2 = Player.new('player2',nil)
end
