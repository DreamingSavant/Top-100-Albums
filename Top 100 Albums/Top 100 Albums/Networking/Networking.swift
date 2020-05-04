//
//  AlbumRequest.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

class Networking: NSObject {
    
    /**
     Service call that will give the list of the top 100 albums on itunes
     - Parameters:
        - type: Codable confirmed struct Model.type
        - completion: Results of the request, general cases handled
     
     - Returns: If successful, will return list of top 100 albums
     */
    func performNetworkTask<T: Codable>(type: T.Type, completion: ((Result<(T), ErrorDescription>) -> Void)?) {
        
        let feedURL = URL(string: "https://rss.itunes.apple.com/api/v1/ca/apple-music/top-albums/all/100/explicit.json")
        
        guard let url = feedURL else {
            
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let error = error {
                completion?(.failure(.init(errorDescription: error.localizedDescription)))
                return
            }
            guard urlResponse != nil else {
                completion?(.failure(.init(errorDescription: "Bad url Response")))
                return
            }

            guard let data = data else {
                completion?(.failure(.init(errorDescription: "No data returned")))
                return
            }
            let response = Response(data: data)
            
            guard let decoded = response.decode(type) else {
                completion?(.failure(.init(errorDescription: error?.localizedDescription)))
                return
            }
            print("here is the decoded file: \(decoded)")
            completion?(.success(decoded))
        }
        
        urlSession.resume()
    }
}



