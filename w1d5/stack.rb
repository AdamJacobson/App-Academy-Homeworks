class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end

  def inspect
    @stack.inspect
  end
end

if __FILE__ == $PROGRAM_NAME
  stack = Stack.new
  p stack
  stack.add(1)
  stack.add(2)
  stack.add(3)
  puts stack.show == [1, 2, 3]
  p stack
  stack.remove
  stack.remove
  p stack
  stack.remove
  stack.remove
  p stack

end
