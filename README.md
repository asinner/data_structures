# README
This library contains a number of sorting algorithms


## Quick Sort
This sort method picks a pivotal value out of the array. All values left of the pivot must be less than the pivot, while all values right of the pivot must be greater than the pivot. Recursively apply that logic to either side and you have the quick sort algorithm

## Insertion Sort
This sort method can be found here (http://en.wikipedia.org/wiki/Insertion_sort)
Example usage:
```ruby
array = (5, 4, 1, 6).to_a.shuffle
puts Sort.insertion(array) # => (1, 4, 5, 6)
```
This algorithm iterates an array left to right starting at the second index. It breaks to the next loop if the value at the current index is greater than the value at the previous index. Otherwise, starting at the current index, iterates back down to the left and swaps each value if the proceeding value is greater than the current value. 

Sources: Sunny Mittal (@sunny-mittal) Thanks for the beginning break. You bring us down a whole octave! *In a good way*

## Merge Sort
This code taken from here http://stackoverflow.com/a/23588449.
Example usage:
```ruby
array = (5, 4, 1, 6).to_a.shuffle
puts Sort.merge_sort(array) # => (1, 4, 5, 6)
```

How it works:
The merge_sort class level method returns itself if the array that was passed has a length <= 1. Why is that?
Because there's nothing to merge. Moving on, if there is more than 1 element, the algorithm continues.
It first gets the middle number of the array
```ruby
mid = array.size / 2 # => integer
```
Then, it gets the left half of the array using the array[0, n] notation:
```ruby
left  = array[0, mid]
```
And it gets the right half the array:
```ruby
right = array[mid, array.size-mid]
```
Then it merges either half. But first it calls merge sort on either half. Which means each half gets split again until finally there are `n` number of arrays.
Then using the merge method each left and right array gets merged.
```ruby
merge(merge_sort(left), merge_sort(right))
```
This creates an empty array to put the sorted numbers into.
Then until either half is empty, it puts the numbers in order into the sorted array and shifts the array by one.
```ruby
def self.merge(left, right)
  sorted = []
  until left.empty? or right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end
```




