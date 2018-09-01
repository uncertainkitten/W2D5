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
    @prev.next = @next unless @next.nil? || @prev.nil?
    @next.prev = @prev unless @prev.nil? || @next.nil?
    @key = nil
    @val = nil
    @next = nil
    @prev = nil
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  include Enumerable

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def []=(i, val)
    each_with_index { |link, j| link.val = val if i == j}
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    return true if get(key).nil? == false
    false
  end

  def append(key, val)
    child = Node.new(key, val)
    if empty?
      @head.next = child
      child.prev = @head
      child.next = @tail
      @tail.prev = child
    else
      child.prev = self.last
      self.last.next = child
      @tail.prev = child
      child.next = @tail
    end
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key == key
    end
    nil
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        break
      end
    end
  end

  def each(&prc)
    item = self.first
    until item == @tail
      prc.call(item)
      item = item.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
