require 'minitest/autorun'
require 'minitest/spec'
require 'doubly_linked_list'
require 'benchmark'

describe List do

  let(:list) do
    list = List.new
    200.times do
      list.add(List::Node.new(rand(1..100)))
    end
    list
  end

  it 'should add a node' do
    n = List::Node.new('Andrew')
    list.add(n)
    assert list.head, n
  end

  it 'should delete all nodes with a given value' do
    n = List::Node.new('Bob')
    list.delete('Bob')
  end
end
