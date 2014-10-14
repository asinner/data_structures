require 'minitest/autorun'
require 'minitest/spec'
require 'sort'
require 'benchmark'

describe Sort do
  it 'should insertion sort an array on best case' do
    array = (1..10_000).to_a.shuffle
    assert_equal (1..10_000).to_a, Sort.insertion(array)
  end

  it 'should be benchmarked best case' do
    array = (1..10_000).to_a
    puts 'Best case'
    puts Benchmark.measure { Sort.insertion(array) }
  end

  it 'should be benchmarked worst case' do
    array = 10_000.downto(1).to_a
    puts 'Worst case'
    puts Benchmark.measure { Sort.insertion(array) }
  end

  it 'should be benchmarked random case' do
    array = (1..10_000).to_a.shuffle
    puts 'Random case'
    puts Benchmark.measure { Sort.insertion(array) }
  end
end
