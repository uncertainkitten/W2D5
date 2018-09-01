class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    h_key = key.hash
    item = key
    unless include?(h_key)
      @count += 1
      self[h_key] << item
      if @count >= num_buckets
        resize!
      end
    end
  end

  def include?(key)
    h_key = key.hash
    item = key
    self[h_key].include?(item)
  end

  def remove(key)
    h_key = key.hash
    item = key
    if include?(item)
      @count -= 1
      self[h_key].delete(item)
    end
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.flatten
    @store = Array.new(num_buckets*2) {Array.new}
    temp.each do |el|
      @count -= 1
      insert(el)
    end
  end
end
