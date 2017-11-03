require_relative 'card.rb'
require 'byebug'

class Board
attr_accessor :grid

  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def populate
    deck = []
    possible_values = (0..9).to_a.shuffle
    8.times do |card|
      value = possible_values.pop
      2.times { deck << Card.new(value) }
    end

    deck = deck.shuffle

    @grid.each_with_index do |row, x|
      row.each_index do |y|
        @grid[x][y] = deck.pop
      end
    end
  end

  def render
    puts '********************'
    @grid.each do |row|
      row.each_with_index do |col, idx|
        if col.orientation == :up
          puts "| #{col.to_s} |" if idx == row.length - 1
          print "| #{col.to_s} |" if idx != row.length - 1
        else
          puts "| ? |" if idx == row.length - 1
          print "| ? |" if idx != row.length - 1
        end
      end
    end

    puts '********************'
  end

  def won?
    @grid.all? do |row|
      row.all? do |col|
        col.orientation == :up
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, orientation)
    x, y = pos
    @grid[x][y] = orientation
  end

  def reveal(guessed_pos)
    x, y = guessed_pos
    @grid[x][y].orientation = :up if @grid[x][y].orientation == :down
    @grid[x][y].to_s
  end

end
