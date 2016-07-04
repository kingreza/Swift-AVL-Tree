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
    let left = leftNode?.height ?? 0
    let right = rightNode?.height ?? 0
    return max(left, right)
  }
}

enum BinarySearchTreeError: ErrorType {
  case OutOfBound
}

final class BinarySearchTree<Element: Comparable>: BinarySearchTreeType {

  private(set) var root: Node<Element>?
  private(set) var count: Int = 0


  /**
   Inserts an element into the AVL tree. Duplicate elements are ignored.
   - parameter element: Element which will be added to the tree.
   It must conform to Comparable.
   */
  func insert (element: Element) {
    if let node = root {
      self.insert(element, currentNode: node)
    } else {
      root = Node(value: element)
      count += 1
    }
  }

  private func insert(element: Element, currentNode: Node<Element>) -> Node<Element> {
    var currentNode = currentNode
    if currentNode.value > element {
      if currentNode.leftNode != nil {
        currentNode.leftNode = insert(element, currentNode: currentNode.leftNode!)
      } else {
        currentNode.leftNode = Node<Element>(value: element)
        count += 1
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
        currentNode.rightNode = insert(element, currentNode: currentNode.rightNode!)
      } else {
        currentNode.rightNode = Node<Element>(value: element)
        count += 1
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
    return node?.height ?? -1
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

  /**
   Returns element with the smallest value in the tree.
   - parameter root: Root node for the tree.
   - returns: Node with the smallest value
   */
  func minNode (root: Node<Element>) -> Node<Element> {
    var _current = root
    while let lNode =  _current.leftNode {
      _current = lNode
    }
    return _current
  }

  /**
   Returns element with the largest value in the tree.
   - parameter root: Root node for the tree.
   - returns: Node with the largest value
   */
  func maxNode(root: Node<Element>) -> Node<Element> {
    var _current = root
    while let rNode = _current.rightNode {
      _current = rNode
    }
    return _current
  }
  /**
   Returns the predecessor element of a given element according to in-order traversal of the tree.
   - parameter node: Node from which want the predecessor.
   - returns: Predecessor for the node passed as a parameter
   */
  func predecessor(node: Node<Element>) -> Node<Element>? {
    if let root = root {
      return self.predecessor(node, root: root)
    }
    return nil
  }

  private func predecessor(node: Node<Element>, root: Node<Element>) -> Node<Element>? {
    if let leftSubTree = node.leftNode {
      return maxNode(leftSubTree)
    }

    var _current: Node<Element>? = root
    var result: Node<Element>?
    while _current != nil {
      if _current!.value > node.value {
        _current = _current?.leftNode
      } else if _current!.value < node.value {
        result = _current
        _current = _current!.rightNode
      } else {
        return result
      }
    }
    return result
  }

  /**
   Returns the successor element of a given element according to in-order traversal of the tree.
   - parameter node: Node from which we want the successor.
   - returns: Predecessor for the node passed as a parameter
   */
  func successor(node: Node<Element>) -> Node<Element>? {
    if let root = root {
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
  /**
   Finds an element in the AVL tree. Since the tree is self-balancing,
   this lookup will always be a O(lg n) operation.

   - parameter element: Element we want to find in the tree
   - returns: Element if it is found, nil otherwise.
   */
  func find(element: Element) -> Element? {
    if let node = self.findNode(element) {
      return node.value
    }
    return nil
  }
  /**
   Finds the node for an element in the AVL tree. Since the tree
   is self-balancing, this lookup will always be a O(lg n) operation.

   - parameter element: Element we want to find in the tree
   - returns: Node of the element if it is found, nil otherwise.
   */

  func findNode(element: Element) -> Node<Element>? {
    return findNode(element, node: root)
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
