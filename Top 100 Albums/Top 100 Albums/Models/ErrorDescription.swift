//
//  ErrorDescription.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 5/4/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

struct ErrorDescription: Error {
    var errorDescription: String?
}

extension ErrorDescription {
    static let rateLimitExceededString = "Rate Limit Exceeded"
    static let rateLimitExceeded: ErrorDescription = .init(errorDescription: rateLimitExceededString)
}

extension ErrorDescription: CustomDebugStringConvertible {
    var debugDescription: String {
        return errorDescription ?? "Unknown error"
    }
}
