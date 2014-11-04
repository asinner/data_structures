class List
  attr_accessor :head, :size

  class Node < Struct.new(:value)
    attr_accessor :next, :previous
  end

  def initialize
    self.size = 0
  end

  def add(node)
    c = head
    node.next = c
    c.previous = node if c
    self.size += 1
    self.head = node
  end

  def search(value)
    results = []
    c = head
    while c
      results.push(c) if c.value == value
      c = c.next
    end
    results
  end

  def delete(node)
    node.previous.next = node.next if node.previous
    node.next.previous = node.previous if node.next
    self.head = node.next if node.object_id == head.object_id
    self.size -= 0
    node
  end

  def deduplicate
    values = {}
    c = head
    while c
      delete(c) if values[c.value]
      values[c.value] = c
      c = c.next
    end
  end

  def deduplicate_vanilla
    c = head
    while c
      j = c.next
      while j
        delete(j) if j.value == c.value
        j = j.next
      end
      c = c.next
    end
  end

  def to_s
    c = head
    while c
      puts c.value
      c = c.next
    end
  end
end
