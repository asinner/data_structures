require 'minitest/autorun'
require 'minitest/spec'
require 'queue'
require 'benchmark'

describe Queue do
  it 'should enqueue a value' do
    q = Queue.new
    n = Node.new('Andrew')
    assert_equal q.enqueue(n), 'Andrew'
    assert_equal q.head, n
  end

  it 'should dequeue a value' do
    q = Queue.new
    n1 = Node.new('Andrew')
    n2 = Node.new('Ben')
    q.enqueue(n1)
    q.enqueue(n2)
    assert_equal q.dequeue, 'Andrew'
    assert_equal q.dequeue, 'Ben'
    assert_raises Queue::EmptyQueueError do
      q.dequeue
    end
  end

  it 'should keep track of the size' do
    q = Queue.new
    n1 = Node.new('Andrew')
    n2 = Node.new('Bob')
    q.enqueue(n1)
    q.enqueue(n2)
    assert_equal q.size, 2
  end
end
