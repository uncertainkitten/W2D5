class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
    @store[max] = true
  end

  def insert(num)
    raise OutOfRange, "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise OutOfRange, "Out of bounds" unless is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num >= @store.length || num < 0
    true
  end

  def validate!(num)
  end
end

class OutOfRange < ArgumentError;end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
