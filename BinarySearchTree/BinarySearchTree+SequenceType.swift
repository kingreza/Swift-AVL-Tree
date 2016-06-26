//
//  BinarySearchTree+SequenceType.swift
//  BinarySearchTree
//
//  Created by Reza Shirazian on 2016-06-23.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation


extension BinarySearchTree: SequenceType {

  private func minNode (root: Node<Element>) -> Node<Element> {
    var _current = root
    while _current.leftNode != nil {
      _current = _current.leftNode!
    }
    return _current
  }

  func generate() -> AnyGenerator<Element> {
    var _current: Node<Element>?
    return AnyGenerator {
      if _current != nil {
        _current = self.successor(_current!)
      } else {
        if self.root != nil {
          _current = self.minNode(self.root!)
        }
      }
      return _current != nil ? _current?.value : nil
    }
  }
}
