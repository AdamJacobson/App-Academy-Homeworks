require 'byebug'

class CacheNode
  attr_reader :value, :next, :prev

  def initialize(value, next_node = nil, prev_node = nil)
    @value = value
    @next = next_node
    @prev = prev_node
  end

  def set_next(nx)
    @next = nx
    nx.set_prev(self) if nx.prev != self
  end

  def set_prev(pr)
    @prev = pr
    pr.set_next(self) if pr.next != self
  end

  # insert the current node after the specified node. Update all references
  def insert_after(pr)
    unless pr.next.nil?
      nx = pr.next
      set_next(nx)
      nx.set_prev(self)
    end

    set_prev(pr)
    pr.set_next(self)
  end

  def delete
    pr = self.prev
    nx = self.next

    pr.set_next(nx)
    nx.set_prev(pr)
  end

  def iterate
    node = self
    values = []

    until node.nil?
      values << node.value
      node = node.next
    end
    values
  end

end
