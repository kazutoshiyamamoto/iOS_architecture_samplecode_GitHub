//
//  Request.swift
//  GitHub
//
//  Created by home on 2020/07/01.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

public protocol Request {
    associatedtype Response: Decodable
    var baseURL: URL { get }
    var method: HttpMethod { get }
    var path: String { get }
    var headerFields: [String: String] { get }
    var queryParameters: [String: String]? { get }
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
