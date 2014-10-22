class Queue
  class EmptyQueueError < RuntimeError
  end

  attr_accessor :head, :tail, :size

  def initialize
    self.size = 0
  end

  # Enqueue should
  def enqueue(node)
    self.size += 1
    self.head = node if head.nil?
    c = tail
    self.tail = node
    unless c == node || c.nil?
      c.prev = node
      node.next = c
    end
    node.data
  end

  def dequeue
    fail EmptyQueueError if head.nil?

    node = head

    self.head = node.prev

    self.size -= 1

    node.data
  end
end

class Node
  attr_accessor :data, :prev, :next

  def initialize(data)
    self.data = data
  end
end
