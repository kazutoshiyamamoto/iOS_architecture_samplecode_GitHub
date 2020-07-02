//
//  Response.swift
//  GitHub
//
//  Created by home on 2020/07/02.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
}
