require 'rspec'
require 'tdd'

describe Tdd do
  tdd = Tdd.new
  
  describe '#my_uniq' do
    arr = [1, 1, 1, 2, 3, 4, 4]
    it 'returns unique elements from array' do
      expect(tdd.my_uniq(arr)).to eq([1, 2, 3, 4])
    end

    it 'returns a new array' do
      expect(tdd.my_uniq(arr)).not_to be(arr)
    end

    context 'when array only contains unique elements' do
      arr2 = [1, 2, 3, 4]
      it 'returns a new array with the same elements' do
        expect(tdd.my_uniq(arr2)).to eq(arr2)
      end
    end
  end

  describe '#two_sum' do
    it 'finds all pairs of positions that sum to 0' do
      arr = [-1, 0, 2, -2, 1]
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'returns pairs sorted by index' do
      arr = [-1, 1]
      expect(arr.two_sum).not_to eq([[1, 0]])
    end

    it 'sorts all pairs by first pair elements' do
      arr = [-1, 0, 2, -2, 1]
      expect(arr.two_sum).not_to eq([[2, 3], [0, 4]])
    end

    context 'when first pair elements are equal' do
      it 'sorts pairs by second pair elements' do
        arr = [-1, 1, 1]
        expect(arr.two_sum).not_to eq([[0, 2], [0, 1]])
      end
    end
  end

  describe '#my_transpose' do
    rows = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]

    cols = [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]
    it 'switches between row-oriented and column-oriented representations' do
      expect(tdd.my_transpose(rows)).to eq(cols)
    end

    it 'returns a new array' do
      expect(tdd.my_transpose(rows)).not_to be(rows)
    end
  end

  describe '#stock_picker' do
    it 'returns an array containing the pairs of the most profitable days' do
      stock_prices = [10, -10, 100]
      expect(tdd.stock_picker(stock_prices)).to eq([1, 2])
    end

    it 'does not sell before it buys stocks' do
      stock_prices = [10, -10, 100, -20]
      expect(tdd.stock_picker(stock_prices)).to eq([1, 2])
    end
  end

end
