def bad_two_sum?(arr, target)
  arr.each_index do |idx1|
    arr.each_index do |idx2|
      next if idx2 <= idx1
      return true if arr[idx1] + arr[idx2] == target
    end
  end
  false
end

def okay_two_sum?(arr, target)
  sorted_arr = arr.sort
  return true if bsearch(sorted_arr, target)
  false
end

def bsearch(arr, target)
  return nil if arr.empty?
  mid = arr.length / 2
  left = arr.take(mid)
  right = arr.drop(mid + 1)

  case arr[mid] <=> target
  when -1
    subanswer = bsearch(right, target)
    subanswer.nil? ? nil : subanswer + mid + 1
  when 0
    mid
  when 1
    bsearch(left, target)
  end
end

p okay_two_sum?([0,1,8,2,7], 5)

def best_two_sum?(arr, target)
  new_hash = Hash.new {}
end
