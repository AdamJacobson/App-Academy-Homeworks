class Map
  def initialize
    @map = {}
  end

  def assign(key, value)
    @map[key] = value
  end

  def lookup(key)
    @map[key]
  end

  def remove(key)
    @map.delete(key)
  end

  def show
    @map.to_a
  end

  def inspect
    @map.inspect
  end
end

if __FILE__ == $PROGRAM_NAME
  map = Map.new
  p map
  map.assign("name", "adam")
  map.assign("age", 28)
  p map
  map.remove("age")
  p map
  p map.lookup("name")
  p map.show
end
