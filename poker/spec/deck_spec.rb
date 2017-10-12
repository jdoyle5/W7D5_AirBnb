require 'rspec'
require 'deck'
require 'card'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it 'initializes a populated deck of 52 unique cards' do
      expect(deck.cards.length).to eq(52)
      cards = deck.cards.map { |card| [card.value, card.suit] }
      expect(cards.uniq).to eq(cards)
    end
  end

  describe '#shuffle' do
    it 'shuffles the deck' do
      dup_deck = deck.cards.dup
      expect(deck.shuffle).not_to eq(dup_deck)
    end
  end

  describe '#deal' do
    it 'removes one card from the deck' do
      deck.deal
      expect(deck.cards.length).to eq(51)
    end

    it 'returns a card' do
      expect(deck.deal).to be_an_instance_of(Card)
    end
  end

  describe '#deal_hand' do
    it 'returns an array of five cards' do
      expect(deck.deal_hand.length).to eq(5)
    end
  end
end
