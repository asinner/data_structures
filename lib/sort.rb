class Array
  def sorts(algo)
    send(algo)
  end

  def quick
    return self if size == 1
    gp = 0
    self[0..-2].each_with_index do |num, index|
      if num <= self[-1]
        self[gp], self[index] = self[index], self[gp]
        gp += 1
      end
    end
    self[gp], self[-1] = self[-1], self[gp]
    (self[0..(gp - 1)].quick + self[gp..-1].quick)
  end

  def insertion
    array = *self
    return array if size == 1
    array.each_with_index do |_num, i|
      j = i
      while j >  0
        break if array[j] > array[j - 1]
        array[j], array[j - 1] = array[j - 1], array[j]
        j -= 1
      end
    end
  end

  def merge
    array = *self
    return array if array.size <= 1
    mid = array.size / 2
    left  = array[0, mid]
    right = array[mid, array.size - mid]
    merge_arrays(left.merge, right.merge)
  end

  def radix
    array = *self
    buckets = Array.new(10) { [] }
    array.max.to_s.length.times do |i|
      array.each do |num|
        buckets[((num / 10**i) % 10)] << num
      end
      array = buckets.flatten
      buckets.each(&:clear)
    end
    array
  end

  private

  def merge_arrays(left, right)
    sorted = []
    until left.empty? || right.empty?
      if left.first <= right.first
        sorted << left.shift
      else
        sorted << right.shift
      end
    end
    sorted.concat(left).concat(right)
  end
end
