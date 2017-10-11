require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:towers) { TowersOfHanoi.new }

  describe '#initialize' do
    context 'when no argument passed into initialize' do
      it 'initializes tower1 with four discs' do
        expects(towers.tower1).to eq([1, 2, 3, 4])
      end
    end

    context 'when an argument is passed into initialize' do
      another_tower = TowersOfHanoi.new(7)
      it 'initializes tower1 with passed argument' do
        expects(another_tower.tower1).to eq([1, 2, 3, 4, 5, 6, 7])
      end
    end

    it 'initializes tower2 and tower3 as empty arrays' do
      expect(towers.tower2).to be_empty
      expect(towers.tower3).to be_empty
    end
  end

  describe '#move' do
    it 'removes topmost disk from starting tower' do

    end

    it 'adds disk to the top of ending tower' do
      
    end
  end

end
