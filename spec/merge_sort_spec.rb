require 'minitest/autorun'
require 'minitest/spec'
require 'sort'
require 'benchmark'

describe Sort do
  it 'should insertion sort an array' do
    array = (1..10_000).to_a.shuffle
    assert_equal (1..10_000).to_a, Sort.merge_sort(array)
  end

  it 'should be benchmarked' do
    array = (1..10_000).to_a
    puts 'Best case - merge_sort'
    puts Benchmark.measure { Sort.merge_sort(array) }

    array = (1..10_000).to_a.reverse
    puts 'Worst case - merge_sort'
    puts Benchmark.measure { Sort.merge_sort(array) }

    array = (1..10_000).to_a.shuffle
    puts 'Random case - merge_sort'
    puts Benchmark.measure { Sort.merge_sort(array) }
  end
end
