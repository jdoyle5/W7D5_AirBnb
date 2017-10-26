require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  # attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    result = @map.get(key)
    if result.nil?
      calc!(key)
    else
      update_node!(result)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    eject! if count == @max
    val = @prc.call(key)
    node = @store.append(key, val)
    @map.set(key, node)
    val
  end

  def update_node!(node)
    node.remove
    node = @store.append(node.key, node.val)
    @map.delete(node.key)
    @map.set(node.key, node)
    return node.val
  end

  def eject!
    node = @store.first.remove
    @map.delete(node.key)
  end
end

prc=  Proc.new {|a| a ** a }
lru = LRUCache.new(3, prc)
lru.get(1)
lru.get(2)
lru.get(3)
lru.get(1)
lru.get(0)
lru.get(3)
lru.get(0)
p lru.instance_variable_get(:@store).map { |l| l.key }
