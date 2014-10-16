require 'minitest/autorun'
require 'minitest/spec'
require 'sort'
require 'benchmark'

describe Array do
  it 'should insertion sort an array' do
    array = (1..10_000).to_a.shuffle
    assert_equal (1..10_000).to_a, array.sorts(:insertion)
  end

  it 'should be benchmarked' do
    array = (1..10_000).to_a
    puts 'Best case - insertion_sort'
    puts Benchmark.measure { array.sorts(:insertion) }

    array = (1..10_000).to_a.reverse
    puts 'Worst case - insertion_sort'
    puts Benchmark.measure { array.sorts(:insertion) }

    array = (1..10_000).to_a.shuffle
    puts 'Random case - insertion_sort'
    puts Benchmark.measure { array.sorts(:insertion) }
  end
end
