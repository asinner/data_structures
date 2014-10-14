# The sort class has class level methods to sort array
class Sort
  def self.insertion(array)
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

  def self.merge_sort(array)
    return array if array.size <= 1
    mid = array.size / 2
    left  = array[0, mid]
    right = array[mid, array.size - mid]
    merge(merge_sort(left), merge_sort(right))
  end

  def self.merge(left, right)
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
