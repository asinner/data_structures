# README
This library contains a number of sorting algorithms

## Binary Tree
The binary tree is a data structure containing nodes, which have two children, and one parent node. Each node also contains a value.
The spec for the binary tree contains testing three methods of depth-first traversal:
- pre_order
- in_order
- post_order

## Hash table
The hash table data structure is used to store key value pairs. This is essentially how it works:

- Create an array of fixed size [0..n]
- Given a key, compute an index from a hash of that key
 - In this library, the hash computes the sum of ordinal values of all characters in the string
- Insert the key => value pair into the computed index

This hash table library handles collisions by forming linked lists, and searching for the key, at each slot in the hash table.
Reassignment is handled by the newest node being inserted at the head.

## Queue
The Queue data structure contains a set of nodes. This data structure has three methods:
- `enqueue`: inserts a node into the set of the structure. Returns the value of the node.
- `dequeue`: removes a node from structure in FIFO order. Returns the value of the removed node. Raises an EmptyQueueError if the Queue is nil.
- `size`: reports the number of nodes in the queue. 

The Queue data structure keep track of the first and last node using the `:head` and `:tail` accessors.

### Example Usage
Create the queue
```ruby
q = Queue.new

n1 = Node.new('Andrew') # create a node
n2 = Node.new('Ben')
n3 = Node.new('Chris')

q.enqueue(n1) # => insert a node
q.enqueue(n2)
q.enqueue(n3)

q.head # => returns n1
q.tail # => returns n3

q.dequeue # => returns n1
q.dequeue # => returns n2
q.dequeue # => returns n2
q.dequeue # => Raises EmptyQueueError
```

## Stack
The stack data structure takes a linked list approach. The stack.rb file contains two levels: Stack & Frame. A stack knows only about the top most frame (the last frame pushed in). The stack object can pop off only the last frame

## Linked List
The linked list file contains two classes: List & Node. These two classes are structure to build a singly linked list.
### Example usage
```ruby
list = List.new # => <ListObject>

list.insert(Node.new('Andrew')) # => points the list head to the Andrew node

list.insert(Node.new('Bob')) # => points list head to the Bob node

list.search('Bob') # => Starts at the list head and searches node until a node with data == 'Bob' is found

list.remove('Bob') # => Traverses list from head until the node with data == 'Bob' is found then removes it and updates connections

list.to_s # => Prints a newline for each nodes data value
```

## Radix Sort
First get amount of digits in the biggest number.
Iterate that many times through the array.
Iterate up through the digit places and place into respective bucket.
Reassign the array each time to the flattened bucket.
Last pass will produce a sorted array

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




