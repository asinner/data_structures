require 'minitest/autorun'
require 'minitest/spec'
require 'stack'
require 'benchmark'

describe Stack do
  it 'should push a value into the stack' do
    stack = Stack.new
    assert stack.push('Andrew'), 'Andrew'
  end

  it 'should pop the most recent value off the stack' do
    stack = Stack.new
    stack.push('Andrew')
    stack.push('Ben')
    assert stack.pop, 'Andrew'
    assert stack.pop, 'Ben'
    assert_nil stack.pop
  end
end
