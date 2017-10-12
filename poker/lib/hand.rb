require_relative 'card'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def receive_hand(cards)
    @cards += cards
  end

  def receive_card(card)
    @cards << card
  end

  def royal_flush?
    suit = @cards[0].suit
    if @cards.all? { |card| card.suit == suit }
      @cards.all? { |card| card > Card.new('9', suit) }
    else
      false
    end
  end

  def four_of_a_kind?
    card_counts = Hash.new(0)

    @cards.each do |card|
      card_counts[card.value] += 1
    end

    card_counts.values.any? { |count| count == 4}
  end

  def straight_flush?
    return false if royal_flush?
    suit = @cards[0].suit

    if @cards.all? { |card| card.suit == suit }
      Card.values.index(Card.high_card(@cards).value) -
      Card.values.index(Card.low_card(@cards).value) == 4
    else
      false
    end
  end

end
