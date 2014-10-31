class BinaryTree
  attr_accessor :head
  
  class Node
    attr_accessor :value, :left, :right
    
    def initialize(value)
      self.value = value
    end
  end
  
  def traverse(method)
    send(method, self.head)
  end
  
  def pre_order(node)
    return unless node
    visit(node)
    pre_order(node.left)
    pre_order(node.right)
  end
  
  def in_order(node)
    return unless node
    in_order(node.left)
    visit(node)
    in_order(node.right)
  end
  
  def post_order(node)
    return unless node
    post_order(node.left)
    post_order(node.right)
    visit(node)
  end
  
  def visit(node)
    puts node.value
  end
end