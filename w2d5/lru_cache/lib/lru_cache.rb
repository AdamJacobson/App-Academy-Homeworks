class LRUCache
  attr_reader :max_size

  def initialize(max_size)
    @max_size = max_size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
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
