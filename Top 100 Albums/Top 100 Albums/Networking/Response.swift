//
//  Response.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/29/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode <T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch _ {
            return nil
        }
    }
}
