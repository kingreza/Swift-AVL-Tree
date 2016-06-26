//
//  BinarySearchTree+CollectionType.swift
//  BinarySearchTree
//
//  Created by Reza Shirazian on 2016-06-26.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

extension BinarySearchTree: CollectionType {

  var startIndex: Int {
    return 0
  }

  var endIndex: Int {
    return count
  }

  subscript(index: Int) -> Element {
    return self.findItemAtIndexUnsafe(index).value
  }

  private func findItemAtIndexUnsafe(index: Int) -> Node<Element> {
    var index = index
    return findItemAtIndex(&index, node: root!)!
  }

  func findItemAtIndex(inout index: Int, node: Node<Element>) -> Node<Element>? {
    var result: Node<Element>?

    if index == 0 {
      return node
    }

    if node.leftNode != nil {
      result = findItemAtIndex(&index, node: node.leftNode!)
    }

    index -= 1
    if node.rightNode != nil {
      result = findItemAtIndex(&index, node: node.rightNode!)
    }

    return result
  }

  func findItemAtIndex(index: Int) throws -> Node<Element> {
    if let root = root {
      var index = index
      if let result = findItemAtIndex(&index, node: root) {
        return result
      }
    }
    throw BinarySearchTreeError.OutOfBound
  }
}
