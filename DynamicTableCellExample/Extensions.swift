//
//  Extensions.swift
//  DynamicTableCellExample
//
//  Created by Lin He on 3/8/15.
//  Copyright (c) 2015 Lin He. All rights reserved.
//

import Foundation

infix operator >>> { associativity left precedence 150 }

// http://robots.thoughtbot.com/efficient-json-in-swift-with-functional-concepts-and-generics
func >>><A, B>(a: A?, f: A -> B?) -> B? {
  if let x = a {
    return f(x)
  } else {
    return .None
  }
}