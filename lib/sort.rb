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
end