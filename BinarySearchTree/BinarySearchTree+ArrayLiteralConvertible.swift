//
//  BinarySearchTree+ArrayLiteralConvertible.swift
//  BinarySearchTree
//
//  Created by Reza Shirazian on 2016-06-26.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

extension BinarySearchTree: ArrayLiteralConvertible {
   convenience init(arrayLiteral: Element...) {
    self.init()
    for element in arrayLiteral {
      self.insert(element)
    }
  }
}
