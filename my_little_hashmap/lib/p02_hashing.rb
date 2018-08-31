class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    arr_hash = 0
    self.each_with_index do |el, idx|
      arr_hash += (idx.hash + el) ^ (idx.hash * el)
    end
    arr_hash
  end
end

class String

  def hash
    alphanumerics = ('!'..'?').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
    str_hash = 0

    self.chars.each.with_index do |char, idx|
      base = alphanumerics.find_index(char)
      if is_prime?(base)
        str_hash += base * idx ^ str_hash * idx
      else
        str_hash -= base * str_hash ^ str_hash + base
      end
    end
  str_hash
  end

  private
  def is_prime?(num)
    return false if num <= 1
    (2...num).each do |i|
      return false if num % i == 0
    end
    return true
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hsh_hash = 0
    self.each do |key, value|
      hkey, hval = key.hash, value.hash
      case is_prime?(hkey)
      when true && is_prime?(hval)
        hsh_hash += hval + hkey
      when true && !is_prime?(hval)
        hsh_hash -= hval + hkey
      when false && is_prime?(hval)
        hsh_hash += hval * hkey
      else
        hsh_hash -= hval * hkey
      end
    end

    hsh_hash
  end

  private
  def is_prime?(num)
    return false if num <= 1
    (2...num).each do |i|
      return false if num % i == 0
    end
    return true
  end
end
