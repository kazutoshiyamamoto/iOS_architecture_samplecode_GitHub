//
//  ItemsResponse.swift
//  GitHub
//
//  Created by home on 2020/07/03.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

public struct ItemsResponse<Item: Decodable>: Decodable {
    public let totalCount: Int
    public let incompleteResults: Bool
    public let items: [Item]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
    
    public init(totalCount: Int, incompleteResults: Bool, items: [Item]) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
}
