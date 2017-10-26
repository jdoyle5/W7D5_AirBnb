def my_min(arr)
  arr.each_index do |idx1|
    first = arr[idx1]
    first_smallest = true

    arr.each_index do |idx2|
      second = arr[idx2]
      # next if idx1 == idx2

      if second < first
        first_smallest = false
      end

    end

    return first if first_smallest
  end
end

def simple_my_min(arr)
  smallest = nil

  arr.each do |el|
    if smallest.nil? || el < smallest
      smallest = el
    end
  end

  smallest
end

def largest_contiguous_subsum(list)
  perms = []
  list.each_index do |idx1|
    list.each_index do |idx2|
      next if idx2 < idx1
      perms << list[idx1..idx2]
    end
  end
  perms.map { |perm| perm.reduce(:+) }.max
end

def better_largest_contiguous_subsum(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  largest
end

list = [-1, 5, 3, -8, -5, 7]
p better_largest_contiguous_subsum(list)
