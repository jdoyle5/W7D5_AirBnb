class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @head.prev = nil
    @tail.prev = @head
    @tail.next = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head.next unless @head.next == @tail
    nil
  end

  def last
    return @tail.prev unless @tail.prev == @head
    nil
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.val if node.key == key }
    nil
  end

  def include?(key)
    each { |node| return true if node.key == key }
    false
  end

  def append(key, val)
    current_node = Node.new(key, val)
    @tail.prev.next = current_node
    current_node.prev = @tail.prev
    @tail.prev = current_node
    current_node.next = @tail
    current_node
  end

  def update(key, val)
    each { |node| node.val = val if node.key == key }
    nil
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        return node
      end
    end
  end

  def each(&prc)
    current_node = @head.next
    until current_node == @tail
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  def each_with_index(&prc)
    idx = 0
    current_node = @head.next
    until current_node == @tail
      prc.call(current_node, idx)
      current_node = current_node.next
      idx += 1
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
