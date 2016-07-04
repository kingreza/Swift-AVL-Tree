//
//  BinarySearchTree+SequenceType.swift
//  BinarySearchTree
//
//  Created by Reza Shirazian on 2016-06-23.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation


extension BinarySearchTree: SequenceType {

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
      return _current?.value ?? nil
    }
  }
}
