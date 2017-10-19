require 'rspec'
require 'hand'
require 'deck'

describe Hand do
  subject(:hand) { Hand.new }
  let(:deck) { Deck.new }

  describe '#initialize' do
    it 'initializes the hand as an empty array' do
      expect(hand.cards).to be_empty
    end
  end

  describe '#receive_hand' do
    it 'adds five cards to the cards array' do
      hand.receive_hand(deck.deal_hand)
      expect(hand.cards.length).to eq(5)
    end
  end

  describe '#receive_card' do
    it 'adds one card to the cards array' do
      hand.receive_card(deck.deal)
      expect(hand.cards.length).to eq(1)
    end
  end

  describe '#royal_flush?' do
    it 'returns true if hand is a royal flush' do
      royal_flush = [
        Card.new('A', :spades), Card.new('K', :spades),
        Card.new('Q', :spades), Card.new('J', :spades),
        Card.new('10', :spades)
      ]
      hand.receive_hand(royal_flush)
      expect(hand.royal_flush?).to be true
    end

    it 'returns false if it is not' do
      not_royal_flush = [
        Card.new('A', :spades), Card.new('K', :spades),
        Card.new('Q', :spades), Card.new('J', :spades),
        Card.new('10', :hearts)
      ]
      hand.receive_hand(not_royal_flush)
      expect(hand.royal_flush?).to be false
    end
  end

  describe '#four_of_a_kind?' do
    it 'returns true if hand is four of a kind' do
      four_of_a_kind = [
        Card.new('A', :diamonds), Card.new('A', :spades),
        Card.new('A', :hearts), Card.new('A', :clubs),
        Card.new('10', :spades)
      ]
      hand.receive_hand(four_of_a_kind)
      expect(hand.four_of_a_kind?).to be true
    end

    it 'returns false if it is not' do
      not_four_of_a_kind = [
        Card.new('A', :spades), Card.new('K', :spades),
        Card.new('Q', :spades), Card.new('J', :spades),
        Card.new('10', :hearts)
      ]
      hand.receive_hand(not_four_of_a_kind)
      expect(hand.four_of_a_kind?).to be false
    end
  end

  describe '#straight_flush?' do
    it 'returns true if hand is four of a kind' do
      straight_flush = [
        Card.new('2', :spades), Card.new('3', :spades),
        Card.new('4', :spades), Card.new('5', :spades),
        Card.new('6', :spades)
      ]
      hand.receive_hand(straight_flush)
      expect(hand.straight_flush?).to be true
    end

    it 'returns false if it is a royal flush' do
      royal_flush = [
        Card.new('A', :spades), Card.new('K', :spades),
        Card.new('Q', :spades), Card.new('J', :spades),
        Card.new('10', :spades)
      ]
      hand.receive_hand(royal_flush)
      expect(hand.straight_flush?).to be false
    end

    it 'returns false if it is not' do
      not_straight_flush = [
        Card.new('2', :spades), Card.new('K', :spades),
        Card.new('Q', :diamonds), Card.new('J', :spades),
        Card.new('10', :spades)
      ]
      hand.receive_hand(not_straight_flush)
      expect(hand.straight_flush?).to be false
    end

  end
end
