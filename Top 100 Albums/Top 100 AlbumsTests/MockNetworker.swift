//
//  MockNetworker.swift
//  Top 100 AlbumsTests
//
//  Created by Roderick Presswoodd on 5/4/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation
@testable import Top_100_Albums

class MockNetworker: NetworkingProtocol {
    
    let fileName: String
    
    init(_ rootFile: String) {
        self.fileName = rootFile
    }
    
    func performNetworkTask<T: Codable>(type: T.Type, completion: ((Result<(T), ErrorDescription>) -> Void)?) {
        guard let path = Bundle(for: Top_100_AlbumsTests.self).path(forResource: fileName, ofType: "json") else {
            fatalError("Cant find \(fileName).json file")
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let dataResponse = Response(data: data)
            guard let response = dataResponse.decode(T.self) else {
                completion?(.failure(.init(errorDescription: "error parsing \(fileName).json")))
                return
            }
            completion?(.success(response))
        } catch {
            completion?(.failure(.init(errorDescription: "error parsing \(fileName).json")))
        }
    }
    
}
