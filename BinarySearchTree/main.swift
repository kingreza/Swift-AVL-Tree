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

//for _ in 0...100 {
//  let rand = Int(arc4random_uniform(100))
//  tree.add(rand)
//}

tree.insert(7)
tree.insert(3)
tree.insert(4)
tree.insert(9)
tree.insert(2)
tree.insert(1)
//
//for index in 0..<100000 {
//  tree.insert( Int(arc4random_uniform(1000000) + 1))
//}

var node = tree.findNode(1)
tree.printHeight()
var next = tree.successor(node!)
print(next!.value)

print("Hello World! Again!")

var result = tree[5]

for value in tree {
  print(value)
}

print(result)
