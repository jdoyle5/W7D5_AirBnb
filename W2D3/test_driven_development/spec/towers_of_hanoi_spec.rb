require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:towers) { TowersOfHanoi.new }

  describe '#initialize' do
    context 'when no argument passed into initialize' do
      it 'initializes tower1 with four discs' do
        expect(towers.tower1).to eq([1, 2, 3, 4])
      end
    end

    context 'when an argument is passed into initialize' do
      another_tower = TowersOfHanoi.new(7)
      it 'initializes tower1 with passed argument' do
        expect(another_tower.tower1).to eq([1, 2, 3, 4, 5, 6, 7])
      end
    end

    it 'initializes tower2 and tower3 as empty arrays' do
      expect(towers.tower2).to be_empty
      expect(towers.tower3).to be_empty
    end

    it 'initializes a towers array containing the three towers' do
      expect(towers.towers).to eq([towers.tower1, towers.tower2, towers.tower3])
    end
  end

  describe '#move' do
    before(:each) do
      towers.move(1, 2)
    end

    it 'removes topmost disk from starting tower' do
      expect(towers.tower1).to eq([2, 3, 4])
    end

    it 'adds disk to the top of ending tower' do
      expect(towers.tower2).to eq([1])
    end

    context 'when the receiving tower is not empty' do
      it 'accepts disk if disk to be added is less than topmost disk' do
        another_tower = TowersOfHanoi.new
        another_tower.move(1, 2)
        another_tower.move(1, 3)
        expect { another_tower.move(2, 3) }.not_to raise_error
      end

      it 'rejects disk if disk to be added is greater than topmost disk' do
        another_tower = TowersOfHanoi.new
        another_tower.move(1, 2)
        expect { another_tower.move(1, 2) }.to raise_error('Cannot do this!')
      end
    end
  end

  describe '#won?' do
    it 'returns true if tower2 or tower3 contains all disks' do
      towers.tower1 = []
      towers.tower2 = [1, 2, 3, 4]
      expect(towers.won?).to be true

      towers.tower2 = []
      towers.tower3 = [1, 2, 3, 4]
      expect(towers.won?).to be true
    end
  end
end
