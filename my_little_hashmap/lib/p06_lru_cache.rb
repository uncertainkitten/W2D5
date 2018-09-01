require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @store.count
  end

  def get(key)
    if @map.include?(key)
      node = @map.get(key)
      update_node!(node)
    else
      calc!(key)
    end
    @store.get(key)
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    entry = @prc.call(key)
    @store.append(key, entry)
    @map.set(key, @store.last)
    if count > @max
      eject!
    end
  end

  def update_node!(node)
    key = node.key
    value = node.val
    @store.remove(key)
    @store.append(key, value)
    @map.set(key,@store.last)
  end

  def eject!
    key = @store.first.key
    @store.first.remove
    @map.delete(key)
  end
end
