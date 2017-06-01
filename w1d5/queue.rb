class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end

  def inspect
    @queue.inspect
  end
end

if __FILE__ == $PROGRAM_NAME
  queue = Queue.new
  puts "After new()"
  p queue
  queue.enqueue(1)
  queue.enqueue(2)
  queue.enqueue(3)
  puts "After queueing 3 elements"
  p queue
  puts "dequeue 1 element"
  p queue.dequeue
  puts "dequeueing 1 element"
  p queue
end
