class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
    @max = max
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def bucket(n)
    bucket = n % num_buckets
    self[bucket]
  end

  def insert(num)
    bucket(num) << num unless bucket(num).include?(num)
  end

  def remove(num)
    bucket(num).delete(num) if include?(num)
  end

  def include?(num)
    bucket(num).include?(num)
  end

  private

  def [](num)
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= num_buckets
    unless include?(num)
      bucket(num) << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      bucket(num).delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket(num).include?(num)
  end

  private

  def bucket(n)
    bucket = n % num_buckets
    @store[bucket]
  end

  def [](num)
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }

    old_store.each do |bucket|
      next if bucket.empty?
      bucket.each do |el|
        bucket(el) << el
      end
    end
  end

end
