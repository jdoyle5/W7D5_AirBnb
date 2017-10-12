require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new('2', :spade)}

  describe '#initialize' do
    it 'initializes a card with a value' do
      expect(card.value).to eq('2')
    end

    it 'initializes a card with a suit' do
      expect(card.suit).to eq(:spade)
    end
  end

  describe '#to_s' do
    it "returns a card's value and suit in brackets" do
      expect(card.to_s).to eq('[2, spade]')
    end
  end

end
