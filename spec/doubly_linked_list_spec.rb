require 'minitest/autorun'
require 'minitest/spec'
require 'doubly_linked_list'
require 'benchmark'

describe List do

  before do
    @list = List.new
    2.times do
      (1..100).each { |i| @list.add(List::Node.new(i)) }
    end
  end

  it 'should add a node' do
    n = List::Node.new(101)
    @list.add(n)
    assert @list.head, n
    assert @list.head.next.value = 100
  end

  it 'should find a node with a given value' do
    n1 = List::Node.new(150)
    n2 = List::Node.new('Doesnt get added')
    @list.add(n1)
    assert_equal @list.search(150), [n1]
    assert_not_equal @list.search('Doesnt get added'), [n2]
  end

  it 'should delete any given node' do
    n = List::Node.new(125)
    @list.add(n)
    assert_equal @list.delete(n), n
    assert_equal @list.search(125), []
  end

  it 'should deduplicate values' do
    assert_equal @list.search(1).size, 2
    @list.deduplicate
    assert_equal @list.search(1).size, 1
  end

  it 'should deduplicate values without an external data structure' do
    assert_equal @list.search(29).size, 2
    @list.deduplicate_vanilla
    assert_equal @list.search(29).size, 1
  end
end
