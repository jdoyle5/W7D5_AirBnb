class Card
  include Comparable
  attr_reader :value, :suit

  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  SUITS = [:spades, :hearts, :diamonds, :clubs].freeze

  def self.values
    VALUES
  end

  def self.suits
    SUITS
  end

  def self.high_card(cards)
    cards.sort.last
  end

  def self.low_card(cards)
    cards.sort.first
  end

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "[#{@value}, #{@suit}]"
  end

  protected
  def <=>(card)
    Card.values.index(self.value) <=> Card.values.index(card.value)
  end
end
