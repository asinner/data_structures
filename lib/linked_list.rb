class List
  attr_accessor :head, :size
  
  def initialize
    self.head = nil
    self.size = 0
  end
  
  def insert(node)
    node.next, self.head = self.head, node
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
    return nil if self.head.nil?
    (self.head = self.head.next) && (return node) if self.head == node
    c = self.head
    until c.nil?
      (c.next = node.next) && (return node) if c.next == node
      c = c.next
    end
  end
  
  def to_s
    c = self.head
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