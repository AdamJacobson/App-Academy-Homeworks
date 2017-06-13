class LRUCache
  attr_reader :max_size

  def initialize(max_size)
    @max_size = max_size
    @cache = []

    @head = CacheNode.new(:SENTINEL_HEAD)
    @tail = CacheNode.new(:SENTINEL_TAIL)
    @tail.insert_after(@head)

    @hash = {}
  end

  def count
    @cache.length
  end

  def add(el)
    new_node = CacheNode.new(el)
    new_node.insert_after(@head)
    @hash[el] = new_node

    puts "-------"
    p @head.iterate
    p @hash.map { |k, v| "#{k} => #{v.value}" }
    puts "-------"

    if @cache.include?(el)
      @cache.delete(el)
    else
      @cache.shift if count == @max_size
    end
    @cache.push(el)
  end

  def show
    @cache.inspect
  end

  private
  # helper methods go here!
end
