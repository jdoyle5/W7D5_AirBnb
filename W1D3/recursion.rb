require "byebug"
# range: int, int => arr_of_ints

def range(start, finish)
  # base case
  return nil if finish < start
  return [finish] if start == finish
  # inductive step
  all_numbers = [start]
  all_numbers.concat(range(start + 1, finish))
  all_numbers
end

# recursive_sum: arr_of_nums => num

def recursive_sum(arr_of_nums)
  return arr_of_nums.last if arr_of_nums[1].nil?
  arr_of_nums.shift + recursive_sum(arr_of_nums)
end

# iterative_sum: arr_of_num => num

def iterative_sum(arr_of_nums)
  return nil if arr_of_nums.empty?
  sum = 0
  arr_of_nums.each { |n| sum += n }
  sum
end

# linear_exponent: num, int => num

def linear_exponent(base, exp)
  return Float::NAN if base.zero? && exp.zero?
  return 0 if base.zero?
  return 1 if exp.zero?
  base * linear_exponent(base, exp - 1)
end

# log_exponent: num, int => num

def faster_exponent(base, exp)
  return 0 if base.zero? && !exp.zero?
  return Float::NAN if base.zero? && exp.zero?
  return 1 if exp.zero?
  if exp.odd?
    base * (faster_exponent(base, (exp - 1) / 2)**2)
  else
    faster_exponent(base, exp/2)**2
  end
end

# deep_dup: object => array
# side effect: output array exists in new memory

def deep_dup(array)
  # at very bottom of nested arrays, no longer an array
  return array unless array.is_a?(Array)
  duped_array = []

  array.length.times do |i|
    duped_array << deep_dup(array[i])
  end

  duped_array
end

# fibonacci: int => arr_of_ints

# 1, 1, 2, 3, 5, 8, 13, 21
# 0, 1, 2, 3, 4, 5,  6,  7

def fibonacci_helper(n, arr)
  len = arr.length
  return arr if len >= n
  return fibonacci_helper(n, arr + [1]) if len < 2

  fibonacci_helper(n, arr << arr[-1] + arr[-2])
end

def fibonacci(n)
  fibonacci_helper(n, [])
end

# subsets: array => arr_of_arrays

# [84] pry(main)> subsets([])
# => []
# [85] pry(main)> subsets([1])
# => [[1], [1]]
# [86] pry(main)> subsets([1,2])
# => [[[1], [1], 2], [[1], [1], 2]]

def subsets(arr)
  return [arr] if arr.empty?
  head = arr[0]
  rest = arr[1..-1]
  remaining_subs = subsets(rest)
  # head = arr.pop
  # remaining_subs = [subsets(arr)]
  # extra = deep_dup(remaining_subs)
  # debugger
  remaining_subs + remaining_subs.map { |sub| sub + [head] }
end

# permutations: array => array of permutations (arr_of_arrs)

def permutations(arr)
  return [arr] if arr.empty?
  head = arr[0]
  rest = arr[1..-1]
  remaining_nums = permutations(rest)
  big_perms = []

  remaining_nums.each do |perm|
    (0..perm.length).each do |insert|
      big_perms << perm.take(insert) + [head] + perm.drop(insert)
    end
  end
  big_perms
end

# binary_search: arr_of_objs, obj => int (or nil)

# [31] pry(main)> load 'recursion.rb'
# => true
# [32] pry(main)> binary_search([1, 2, 3], 1)
# => 0
# [33] pry(main)> binary_search([2, 3, 4, 5], 3)
# => 1
# [34] pry(main)> binary_search([2, 4, 6, 8, 10], 6)
# => 2
# [35] pry(main)> binary_search([1, 3, 4, 5, 9], 5)
# => 2
# [36] pry(main)> binary_search([1, 2, 3, 4, 5, 6], 6)
# => 3
# [37] pry(main)> binary_search([1, 2, 3, 4, 5, 6], 0)
# => nil
# [38] pry(main)> binary_search([1, 2, 3, 4, 5, 7], 6)

def binary_search(arr, target)
  return nil if !arr.include?(target) # its not in the array

  len = arr.length
  if len.even?
    bot_mid_pos = (len/2) - 1
    bot_mid_val = arr[bot_mid_pos]

    which_side = target <=> bot_mid_val
    if which_side == -1
      binary_search(arr[0..bot_mid_pos], target)
    elsif which_side.zero?
      return bot_mid_pos
    else
      # debugger
      binary_search(arr[bot_mid_pos + 1..-1], target) + bot_mid_pos + 1
    end
  else # len is odd
    mid_pos = len / 2
    mid_val = arr[mid_pos]
    which_side = target <=> mid_val
    if which_side == -1
      binary_search(arr[0...mid_pos], target)
    elsif which_side.zero?
      return mid_pos
    else
      # debugger
      binary_search(arr[mid_pos + 1..-1], target) + mid_pos + 1
    end
  end
end

# merge_sort: array_of_nums => array_of_nums

def merge_sort(arr)
  return arr if arr[1].nil?
  middle = (arr.length - 1) / 2
  # debugger
  merge_helper(merge_sort(arr[0..middle]), merge_sort(arr[middle + 1..-1]))
end

# merge_helper: sorted_arr_nums, sorted_arr_nums => sorted_arr_nums

def merge_helper(arr1, arr2)
  head1 = arr1.shift
  head2 = arr2.shift
  merged = []

  while head1 || head2
    if head1.nil?
      merged << head2
      head2 = arr2.shift
    elsif head2.nil?
      merged << head1
      head1 = arr1.shift
    elsif head1 < head2
      merged << head1
      head1 = arr1.shift
    else
      merged << head2
      head2 = arr2.shift
    end
  end
  merged
end

# greedy_make_change: int, array_of_ints => array_of_ints

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount.zero?
  coins.sort!.reverse!
  change = []
  biggest = coins.shift
  difference = amount - biggest

  until difference.negative?
    change << biggest
    difference -= biggest
  end

  change + greedy_make_change(difference + biggest, coins)
end

#make_better_change: int, array_of_ints => array_of_ints

def make_better_change(amount, coins = [25, 10, 5, 1])
  return [] if amount.zero?
  coins.sort!.reverse!

  solutions = []

  coins.each do |val|
    diff = amount - val
    solutions << (make_better_change(diff, coins) << val) unless diff.negative?
  end

  solutions
  solutions.sort_by(&:length).first
end
