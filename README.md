# README
This library contains a number of sorting algorithms

## Insertion Sort
This sort method can be found here (http://en.wikipedia.org/wiki/Insertion_sort)
Example usage:
```ruby
array = (5, 4, 1, 6).to_a.shuffle
puts Sort.insertion(array) # => (1, 4, 5, 6)
```
This algorithm iterates an array left to right starting at the second index. It breaks to the next loop if the value at the current index is greater than the value at the previous index. Otherwise, starting at the current index, iterates back down to the left and swaps each value if the proceeding value is greater than the current value. 

Sources: Sunny Mittal (@sunny-mittal) Thanks for the beginning break. You bring us down a whole octave! *In a good way*