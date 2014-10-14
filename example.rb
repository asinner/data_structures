class Sort
  def self.merge_sort(list)
    return list if list.size <= 1
    mid = list.size / 2
    left  = list[0, mid]
    right = list[mid, list.size - mid]
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
