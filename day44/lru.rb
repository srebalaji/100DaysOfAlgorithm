# LRU

class Hash
  attr_accessor :key, :value, :size
  def initialize
    @size = 0
    @ha = {}
  end

  def show
    @ha
  end

  def insert(key, value)
    if @ha.count >= size
      least_used_key = get_least_used_value
      p least_used_key
      @ha.delete(least_used_key)
    end
    @ha[key] = [value, 0]
  end

  def get(key)
    @ha[key][1] += 1 
    @ha[key]
  end

  private
  
  def get_least_used_value
    min = nil
    @ha.each do |key, value|
      min = [key, value[1]] if min.nil? || value[1] < min[1]
    end
    min[0]
  end
end

hash = Hash.new
hash.size = 2
hash.insert("a", 1)
hash.insert("b", 2)
hash.get("a")
hash.get("a")
p hash.show
hash.insert("c", 3)
p hash.show