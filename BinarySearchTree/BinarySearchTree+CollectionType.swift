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
    var currentCount = index
    var result: Node<Element>?
    findItemAtIndex(&currentCount, node: root!, result: &result)
    return result!
  }

  func findItemAtIndex(inout index: Int, node: Node<Element>, inout result: Node<Element>?) {

    if node.leftNode != nil {
      findItemAtIndex(&index, node: node.leftNode!, result: &result)
    }

    if index == 0 {
      result = node
    }
    index -= 1

    if node.rightNode != nil {
      findItemAtIndex(&index, node: node.rightNode!, result: &result)
    }
  }

  func findItemAtIndex(index: Int) throws -> Node<Element> {
    if let root = root {
      var index = index
      var result: Node<Element>?
      findItemAtIndex(&index, node: root, result: &result)
      if let result = result {
        return result
      }
    }
    throw BinarySearchTreeError.OutOfBound
  }
}
