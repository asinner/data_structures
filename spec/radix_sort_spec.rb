require 'minitest/autorun'
require 'minitest/spec'
require 'sort'
require 'benchmark'

describe Array do
  it 'should radix sort an array' do
    array = (1..10_000).to_a.shuffle
    assert_equal((1..10_000).to_a, array.sorts(:radix))
  end

  it 'should be benchmarked' do
    puts 'Radix sort ---------------------'
    array = (1..10_000).to_a
    puts 'Best case'
    puts Benchmark.measure { array.sorts(:radix) }

    array = (1..10_000).to_a.reverse
    puts 'Worst case'
    puts Benchmark.measure { array.sorts(:radix) }

    array = (1..10_000).to_a.shuffle
    puts 'Random case'
    puts Benchmark.measure { array.sorts(:radix) }
    puts '---------------------------------'
  end
end
