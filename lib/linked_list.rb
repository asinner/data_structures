class List
  attr_accessor :head, :size

  def initialize
    self.head = nil
    self.size = 0
  end

  def insert(node)
    node.next, self.head = head, node
    self.size += 1
  end

  def search(value)
    node = head
    until node.nil?
      return node if node.value == value
      node = node.next
    end
  end

  def remove(node)
    return nil if head.nil?
    c = head
    while c
      c.next = node.next if c.next == node
      self.head = node.next if head == node
      c = c.next
      return node
    end
    nil
  end

  def to_s
    c = head
    until c.nil?
      puts c.value
      c = c.next
    end
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value = nil)
    self.value = value
    self.next = nil
  end
end
