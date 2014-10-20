require 'minitest/autorun'
require 'minitest/spec'
require 'linked_list'

describe List do
  it 'should insert a node' do
    list = List.new
    node = Node.new
    list.insert(node)
    assert_equal list.head, node
  end

  it 'should report the size of the list' do
    list = List.new
    3.times { list.insert(Node.new) }
    assert_equal list.size, 3
  end

  it 'should search for a node with a given value and return node if found' do
    list = List.new
    node1 = Node.new('Andrew')
    node2 = Node.new('Bob')
    list.insert(node1)
    list.insert(node2)
    assert_equal list.search('Andrew'), node1
  end

  it 'should search for a node with a given value and return nil if not found' do
    list = List.new
    node1 = Node.new('Andrew')
    node2 = Node.new('Bob')
    list.insert(node1)
    list.insert(node2)
    assert_equal list.search('Christopher'), nil
  end

  it 'should remove a node' do
    list = List.new
    node1 = Node.new('Andrew')
    node2 = Node.new('Bob')
    list.insert(node1)
    list.insert(node2)
    list.remove(node2)
    assert_equal list.search('Bob'), nil
  end
end
