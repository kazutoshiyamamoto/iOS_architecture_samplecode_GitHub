//
//  Pagination.swift
//  GitHub
//
//  Created by home on 2020/07/02.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

public struct Pagination {
    public var next: Int?
    public var last: Int?
    public var first: Int?
    public var prev: Int?
    
    public init(next: Int?, last: Int?, first: Int?, prev: Int?) {
        self.next = next
        self.last = last
        self.first = first
        self.prev = prev
    }
}
