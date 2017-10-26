class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return nil.hash if empty?
    pre_hash = 0
    self.flatten.each do |val|
      val = val.hash
      pre_hash *= 10
      pre_hash += val
    end
    pre_hash.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.map do |arr|
      [arr[0].to_s, arr[1]].hash
    end
    .hash
  end
end
