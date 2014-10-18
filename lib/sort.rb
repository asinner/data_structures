class Array
  def sorts(algo)
    send(algo)
  end

  def quick
    array = *self
    return array if array.size == 1
    pivot = array[-1]
    greater_partition = 0
    array[0..-2].each_with_index do |num, index|
      if num <= pivot
        array[greater_partition], array[index] = array[index], array[greater_partition]
        greater_partition += 1
      end
    end
    array[greater_partition], array[-1] = array[-1], array[greater_partition]
    array = (array[0..(greater_partition - 1)].quick + array[greater_partition..-1].quick)
    array
  end

  def insertion
    array = *self
    i = 1
    while i < array.size
      if array[i] > array[i - 1]
        i += 1
        next
      end
      value = array[i]
      j = i
      while j > 0
        if array[j] < array[j - 1]
          array[j] = array[j - 1]
          array[j - 1] = value
        end
        j -= 1
      end
      i += 1
    end
    array
  end

  def merge
    array = *self
    return array if array.size <= 1
    mid = array.size / 2
    left  = array[0, mid]
    right = array[mid, array.size - mid]
    merge_arrays(left.merge, right.merge)
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
