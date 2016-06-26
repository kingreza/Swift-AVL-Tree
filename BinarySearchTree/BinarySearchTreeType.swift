//
//  BinarySearchTreeType.swift
//  BinarySearchTree
//
//  Created by Reza Shirazian on 2016-06-23.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation
protocol BinarySearchTreeType {
  associatedtype Element
  mutating func insert(element: Element)
  mutating func find(element: Element) -> Element?
}
