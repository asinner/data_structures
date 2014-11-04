require 'minitest/autorun'
require 'minitest/spec'
require 'hash_table'
require 'benchmark'

describe HashTable do
  it 'should be of fixed size' do
    ht = HashTable.new(1024)
    assert_equal(ht.slots.size, 1024)
  end

  it 'should only accept strings' do
    ht = HashTable.new(1024)
    assert_raises HashTable::InvalidKeyError do
      ht.set(:first_name, 'Andrew')
    end
  end

  it 'should hash a key' do
    ht = HashTable.new(1024)
    assert(ht.hash('A'), 'A'.ord)
    assert(ht.hash('B'), 'B'.ord)
    assert_equal(ht.hash('AB'), 'AB'.split('').map(&:ord).reduce(:+))
  end

  it 'should set a key value entry and return index' do
    ht = HashTable.new(1024)
    assert_equal(ht.set('first name', 'Andrew'), (ht.hash('first name') % ht.slots.size))
  end

  it 'should return a value for the stored key' do
    ht = HashTable.new(1024)

    puts Benchmark.measure {
      puts 'Time it takes to insert 250,000 key, value pairs...'
      File.read('/usr/share/dict/words').lines.each do |line|
        (ht.set(line, line.reverse))
      end
    }

    File.read('/usr/share/dict/words').lines[-10, 9].each do |line|
      assert_equal(ht.get(line), line.reverse)
    end

  end
end
