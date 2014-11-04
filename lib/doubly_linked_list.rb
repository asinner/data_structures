class List
  attr_accessor :head

  class Node < Struct.new(:value)
    attr_accessor :next, :previous
  end

  def add(node)
    c = head
    node.next = c
    c.previous = node if c
    self.head = node
  end
end
