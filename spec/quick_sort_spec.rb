require 'minitest/autorun'
require 'minitest/spec'
require 'sort'
require 'benchmark'

describe Array do
  it 'should sort quick sort an array' do
    array = (1..10_000).to_a.shuffle
    assert (1..10_000).to_a, array.sorts(:quick)
  end
  
  it 'should be benchmarked' do
    array = (1..1000).to_a
    puts 'Best case - quick x1000'
    puts Benchmark.measure { array.sorts(:quick) }

    array = (1..1000).to_a.reverse
    puts 'Worst case - quick x1000'
    puts Benchmark.measure { array.sorts(:quick) }

    array = (1..1000).to_a.shuffle
    puts 'Random case - quick x1000'
    puts Benchmark.measure { array.sorts(:quick) }
  end
end