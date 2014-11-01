require 'minitest/autorun'
require 'minitest/spec'
require 'binary_tree'

describe BinaryTree do
  before do
    make_nodes
    connect_nodes
    make_tree
    set_head
  end
  
  def make_nodes
    names = %w(Tim Jony Phil Dan Katie Craig Eddie Peter Andrea)
    names.each do |name|
      instance_variable_set("@#{name.downcase}", BinaryTree::Node.new(name))
    end    
  end
  
  def connect_nodes
    @tim.left, @tim.right = @jony, @phil
    @jony.left, @jony.right = @dan, @katie
    @katie.left, @katie.right = @peter, @andrea
    @phil.left, @phil.right = @craig, @eddie
  end
  
  def make_tree
    @tree = BinaryTree.new
  end
  
  def set_head
    @tree.head = @tim
  end
  
  it "should pre-order traverse the tree" do
    assert_output "Tim\nJony\nDan\nKatie\nPeter\nAndrea\nPhil\nCraig\nEddie\n" do
      @tree.traverse(:pre_order)
    end
  end
  
  it "should in-order traverse the tree" do
    assert_output "Dan\nJony\nPeter\nKatie\nAndrea\nTim\nCraig\nPhil\nEddie\n" do
      @tree.traverse(:in_order)
    end
  end
  
  it "should post-order traverse the tree" do  
    assert_output "Dan\nPeter\nAndrea\nKatie\nJony\nCraig\nEddie\nPhil\nTim\n" do
      @tree.traverse(:post_order)
    end
  end
end
