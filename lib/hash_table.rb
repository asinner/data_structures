require './lib/linked_list'

class HashTable
  class InvalidKeyError < RuntimeError
  end

  class List < List
    def search(key)
      node = head
      until node.nil?
        return node.value if node.key == key
        node = node.next
      end
    end
  end

  class Node < Node
    attr_accessor :key

    def initialize(key, value)
      self.key = key
      self.value = value
    end
  end

  attr_accessor :slots

  def initialize(slots)
    self.slots = Array.new(slots) { HashTable::List.new }
  end

  def hash(key)
    key.split('').map(&:ord).reduce(:+)
  end

  def set(key, value)
    fail InvalidKeyError if key.class != String
    i = index(hash(key))
    node = HashTable::Node.new(key, value)
    slots[i].insert(node)
    i
  end

  def index(hash)
    hash % slots.size
  end

  def get(key)
    i = index(hash(key)) # get the index
    list = slots[i]
    list.search(key)
  end
end
