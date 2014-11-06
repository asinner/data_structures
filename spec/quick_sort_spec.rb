require 'minitest/autorun'
require 'minitest/spec'
require 'sort'
require 'benchmark'

describe Array do
  it 'should sort quick sort an array' do
    array = (1..10_000).to_a.shuffle
    assert((1..10_000).to_a, array.sorts(:quick))
  end

  it 'should be benchmarked' do
    # puts 'Quick sort -----------------------------'
    # array = (1..1000).to_a
    # puts 'Best case'
    # puts Benchmark.measure { array.sorts(:quick) }
    #
    # array = (1..1000).to_a.reverse
    # puts 'Worst case'
    # puts Benchmark.measure { array.sorts(:quick) }
    #
    # array = (1..1000).to_a.shuffle
    # puts 'Random case'
    # puts Benchmark.measure { array.sorts(:quick) }
    # puts '-----------------------------------------'
  end
end
