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

// TODO:理解不足なので呼び出し側の処理実装後見直しが必要
extension Pagination {
    private enum Const {
        // https以前:任意の１文字にマッチする/直前の文字が0回以上 繰り返す場合にマッチ/
        static let regex = try! NSRegularExpression(pattern: ".*<https://api.github.com/.*(?:&|\\?)page=(\\d+).*>; rel=\"(.*)\"", options: [])
    }
    
    init(link: String) {
        let values = link.split(separator: ",")
        
        self = values.reduce(GitHub.Pagination(next: nil, last: nil, first: nil, prev: nil)) { pagination, value in
            let string = String(value)
            let results = Const.regex.matches(in: string,
                                              options: [],
                                              range: NSRange(location: 0, length: (string as NSString).length))
            
            let values = results.compactMap { result-> (Int, String)? in
                let values = (0..<result.numberOfRanges).reduce((nil, nil)) { values, index -> (Int?, String?) in
                    if index == 0 {
                        return values
                    }
                    let range = result.range(at: index)
                    let str = (string as NSString).substring(with: range)
                    
                    if index == 1, let page = Int(str) {
                        return (page, values.1)
                    } else if index == 2 {
                        return (values.0, str)
                    } else {
                        return values
                    }
                }
                
                if case let (page?, name?) = values {
                    return (page, name)
                } else {
                    return nil
                }
            }
            
            return values.reduce(pagination) { pagination, value in
                var newPagination = pagination
                switch value.1 {
                case "next":
                    newPagination.next = value.0
                case "last":
                    newPagination.last = value.0
                case "first":
                    newPagination.first = value.0
                case "prev":
                    newPagination.prev = value.0
                default:
                    break
                }
                return newPagination
            }
        }
    }
}
