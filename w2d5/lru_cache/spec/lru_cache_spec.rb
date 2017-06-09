require 'rspec'
require 'lru_cache'

describe LRUCache do
  subject(:cache) { LRUCache.new(4) }
  context "#new" do
    it "initializes with a max cache size" do
      expect(cache.max_size).to eq(4)
    end
  end

  context "#count" do
    it "returns the number of elements currently cached" do
      cache.add("first element")
      cache.add("second element")
      expect(cache.count).to eq(2)
    end

    it "does not exceed the max cache size" do
      cache.add("first element")
      cache.add("second element")
      cache.add("third element")
      cache.add("fourth element")
      cache.add("fifth element")
      cache.add("sixth element")
      expect(cache.count).to eq(4)
    end
  end

  context "#show" do
    it "shows the cached items with LRU item first" do
      cache.add(1)
      cache.add(2)
      cache.add(3)
      cache.add(4)
      expect(cache.show).to eq("[1, 2, 3, 4]")
    end
  end

  context "#add" do
    it "moves items to the front of the cache when already in the cache" do
      cache.add(1)
      cache.add(2)
      cache.add(3)
      cache.add(2)
      cache.add(4)
      expect(cache.show).to eq("[1, 3, 2, 4]")
    end
  end

end
