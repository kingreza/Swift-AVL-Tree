//
//  main.swift
//  BinarySearchTree
//
//  Created by Reza Shirazian on 2016-06-23.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

print("Hello, World!")



var tree = BinarySearchTree<Int>()

tree.insert(7)
tree.insert(3)
tree.insert(4)
tree.insert(9)
tree.insert(2)
tree.insert(1)

var node = tree.findNode(7)

for index in 0..<tree.count {
  print(tree[index])
}


var reverse = tree.reverse()

for value in reverse {
  print(value)
}

var newTree: BinarySearchTree = ["hello", "world", "this", "is", "a", "new", "day"]

_ = newTree.map {print($0)}
