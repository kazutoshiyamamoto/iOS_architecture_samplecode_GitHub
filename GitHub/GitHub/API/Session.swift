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

public final class Session {
    private let accessToken: () -> AccessToken?
    private let additionalHeaderFields: () -> [String: String]?
    private let session: URLSession
    
    public init(accessToken: @escaping () -> AccessToken? = { nil },
                additionalHeaderFields: @escaping () -> [String: String]? = { nil },
                session: URLSession = .shared) {
        self.accessToken = accessToken
        self.additionalHeaderFields = additionalHeaderFields
        self.session = session
    }
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
