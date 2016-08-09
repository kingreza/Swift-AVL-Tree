# Swift-AVL-Tree
A generic self balancing AVL tree with SequenceType, CollectionType and ArrayLiteralConvertible extensions.

## Usage Example:

```swift
/* 
  Create tree with associated type (must implement Comparable) */
var tree = BinarySearchTree<Int>()

/* Insert items, tree will balance for optimal retrieval */
tree.insert(7)
tree.insert(3)
tree.insert(4)
tree.insert(9)
tree.insert(2)
tree.insert(1)

//Use find to find a node in the tree
var node = tree.findNode(7)

/*
 All items in the tree are accessible through a subscript. 
 You get a sorted array from lowest to highest because 
 of AVL self balancing behaviour [Benefit of CollectionType Protocol] */

for index in 0..<tree.count {
  print(tree[index])
}

/*
  You have access to all CollectionType methods like 
  reverse [Benefit of CollectionType Protocol] */
  
var reverse = tree.reverse()

/* 
  You can traverse the tree using for-in loop [Benefit of SequenceType Protocol] */
  
for value in reverse {
  print(value)
}

/*
 You can build a tree by simply assigning an array to it 
 instead of inserting elements one by one 
 [Benefit of ArrayLiteralConvertible Protcol] */

var newTree: BinarySearchTree = ["hello", "world", "this", "is", "a", "new", "day"]

_ = newTree.map {print($0)}
```
