class HumanPlayer
  require_relative 'board.rb'
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_guess(board)
    p 'Make a guess in coordinate form! (i.e., [x, y])'
    guessed_pos = gets.chomp.split(',').map(&:to_i)
  end

  def receive_revealed_card
  end

  def receive_match
  end

end

class ComputerPlayer

  def initialize
    @known_cards = Hash.new
    @possible_moves = []
    @second_guess = nil
    @current_guess = nil
  end

  def check_known(guess, board)
    matching = @known_cards.select { |k, v| v == board[guess].to_s && guess != k }
    if matching.empty?
      false
    else
      matching.keys
    end
  end

  def find_possible(board)
    @possible_moves = []
    board.grid.each_with_index do |row, idx1|
      board.grid.each_with_index do |col, idx2|
        pos = [idx2, idx1]
        @possible_moves << pos if board[pos].orientation == :down
      end
    end
    @possible_moves - @known_cards.keys
  end

  def make_guess(board)
    matches = @known_cards.select { |k, v| @known_cards.values.count(v) == 2 }.keys
    if matches.count == 2
      guess = matches[0]
      @second_guess = matches[1]
      @known_cards.delete(guess)
      @known_card.delete(@second_guess)
      return guess
    end

    find_possible(board)
    if @second_guess
      @current_guess = @second_guess
      @second_guess = nil
      return @current_guess
    end
    guess = @possible_moves.sample
    if check_known(guess, board)
      @second_guess = check_known(guess, board)
    else
      @known_cards[guess] = board[guess].to_s
    end

    guess
  end
end
