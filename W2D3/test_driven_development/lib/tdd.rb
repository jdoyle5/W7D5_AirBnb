class Tdd

  def my_uniq(arr)
    uniq_hash = {}

    arr.each do |num|
      uniq_hash[num] = true
    end

    uniq_hash.keys
  end

  def my_transpose(rows)
    cols = Array.new(rows.length) { Array.new }

    rows.each_with_index do |row, idx|
      row.each_with_index do |value, idx2|
        cols[idx] << rows[idx2][idx]
      end
    end
    cols
  end

  def stock_picker(prices)
    best = []

    prices.each_with_index do |num1, idx1|
      ((idx1 + 1)...prices.length).each do |idx2|
        if best.empty? || prices[idx2] - num1 > prices[best[1]] - prices[best[0]]
          best = [idx1, idx2]
        end
      end
    end

    best
  end
end

class Array

  def two_sum
    pairs = []

    self.each_with_index do |num1, idx1|
      ((idx1 + 1)...self.length).each do |idx2|
        pairs << [idx1, idx2] if num1 + self[idx2] == 0
      end
    end

    pairs
  end
end
