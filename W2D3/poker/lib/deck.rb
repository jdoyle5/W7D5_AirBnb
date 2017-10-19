require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    populate
  end

  def populate
    Card.values.each do |val|
      Card.suits.each do |suit|
        @cards << Card.new(val, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end

  def deal_hand
    hand = []
    5.times { hand << deal }
    hand
  end
end
