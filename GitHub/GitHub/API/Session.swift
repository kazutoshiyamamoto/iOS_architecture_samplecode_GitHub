//
//  Session.swift
//  GitHub
//
//  Created by home on 2020/07/01.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

public enum SessionError: Error {
    case noData(HTTPURLResponse)
    case noResponse
    case unacceptableStatusCode(Int, Message?)
    case failedToCreateComponents(URL)
    case failedToCreateURL(URLComponents)
}

extension SessionError {
    public struct Message: Decodable {
        public let documentationURL: URL
        public let message: String

        private enum CodingKeys: String, CodingKey {
            case documentationURL = "documentation_url"
            case message
        }
    }
}
