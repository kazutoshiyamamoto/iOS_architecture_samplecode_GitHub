//
//  Request.swift
//  GitHub
//
//  Created by home on 2020/07/01.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

public protocol Request {
    // associatedtypeに関しては以下参考記事
    // https://qiita.com/mshrwtnb/items/2f947eb8422899b84dbc
    associatedtype Response: Decodable
    var baseURL: URL { get }
    var method: HttpMethod { get }
    var path: String { get }
    var headerFields: [String: String] { get }
    var queryParameters: [String: String]? { get }
}

extension Request {
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    public var headerFields: [String: String] {
        return ["Accept": "application/json"]
    }
    
    public var queryParameters: [String: String]? {
        return nil
    }
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
