//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Reza Shirazian on 2016-06-23.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

class Node<Element: Comparable> {
  var value: Element
  var leftNode: Node?
  var rightNode: Node?

  init(value: Element) {
    self.value = value
  }

  var height: Int {
    let left = leftNode != nil ? leftNode!.height + 1 : 0
    let right = rightNode != nil ? rightNode!.height + 1: 0
    return max(left, right)
  }
}
enum BinarySearchTreeError: ErrorType {
  case OutOfBound
}

class BinarySearchTree<Element: Comparable>: BinarySearchTreeType {

  private var _root: Node<Element>?
  private var _count: Int = 0

  var root: Node<Element>? {
    return _root
  }

  var count: Int {
    return _count
  }

  func insert (element: Element) {
    if let _ = _root {
      self.insert(element, currentNode: &_root!)
    } else {
      _root = Node(value: element)
    }
  }

  func printHeight() {
    if let root = _root {
      print(root.height)
    }
  }



  private func insert(element: Element, inout currentNode: Node<Element>) -> Node<Element> {
    if currentNode.value > element {
      if currentNode.leftNode != nil {
        currentNode.leftNode = insert(element, currentNode: &currentNode.leftNode!)
      } else {
        currentNode.leftNode = Node<Element>(value: element)
        _count += 1
      }
      if height(currentNode.leftNode) - height(currentNode.rightNode) == 2 {
        if element < currentNode.leftNode!.value {
          currentNode = rightRotate(currentNode)
        } else {
          currentNode.leftNode = leftRotate(currentNode.leftNode!)
          currentNode = rightRotate(currentNode)
        }
      }
    } else if currentNode.value < element {
      if currentNode.rightNode != nil {
        currentNode.rightNode = insert(element, currentNode: &currentNode.rightNode!)
      } else {
        currentNode.rightNode = Node<Element>(value: element)
        _count += 1
      }

      if height(currentNode.rightNode) - height(currentNode.leftNode) == 2 {
        if element > currentNode.rightNode!.value {
          currentNode = leftRotate(currentNode)
        } else {
          currentNode.rightNode = rightRotate(currentNode.rightNode!)
          currentNode = leftRotate(currentNode)
        }
      }
    }
    return currentNode
  }

  private func balance(node: Node<Element>?) -> Int {
    if let node = node {
      return height(node.leftNode) - height(node.rightNode)
    }
    return 0
  }

  private func height (node: Node<Element>?) -> Int {
    return node != nil ? node!.height : -1
  }
  func printNodeHeights() {
    printNodeHeights(_root)
  }

  private func printNodeHeights(node: Node<Element>?) {
    if let node = node {
      printNodeHeights(node.leftNode)
      print("for node \(node.value) height is \(node.height)")
      printNodeHeights(node.rightNode)
    }
  }

  private func leftRotate(node: Node<Element>) -> Node<Element> {
    let newRoot = node.rightNode!
    let oldRootRight = newRoot.leftNode
    node.rightNode = oldRootRight
    newRoot.leftNode = node
    return newRoot
  }

  private func rightRotate(node: Node<Element>) -> Node<Element> {
    let newRoot = node.leftNode!
    let oldRootLeft = newRoot.rightNode
    node.leftNode = oldRootLeft
    newRoot.rightNode = node
    return newRoot
  }

  private func minNode (root: Node<Element>) -> Node<Element> {
    var _current = root
    while _current.leftNode != nil {
      _current = _current.leftNode!
    }
    return _current
  }

  func successor(node: Node<Element>) -> Node<Element>? {
    if let root = _root {
      return successor(node, root: root)
    }
    return nil

  }

  private func successor(node: Node<Element>, root: Node<Element>) -> Node<Element>? {
    if let righSubTree = node.rightNode {
      return minNode(righSubTree)
    }

    var _current: Node<Element>? = root
    var result: Node<Element>?

    while _current != nil {
      if node.value < _current!.value {
        result = _current
        _current = _current?.leftNode
      } else if node.value > _current!.value {
        _current = _current?.rightNode
      } else {
        return result
      }
    }
    return result
  }

  func find(element: Element) -> Element? {
    if let node = self.findNode(element) {
      return node.value
    }
    return nil
  }

  func findNode(element: Element) -> Node<Element>? {
    return findNode(element, node: _root)
  }

  private func findNode(element: Element, node: Node<Element>?) -> Node<Element>? {
    if let node = node {
      if node.value == element {
        return node
      } else if node.value > element {
        return findNode(element, node: node.leftNode)
      } else if node.value < element {
        return findNode(element, node: node.rightNode)
      }
    }
    return nil
  }
}
