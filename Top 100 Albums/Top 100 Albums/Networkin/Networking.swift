//
//  AlbumRequest.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

struct Results: Codable {
    let albums: [Result]
}

struct Result: Codable {
    var albumName: String
    var artistName: String
    var artistUrl: String?
    var artworkURL: String?
//    var genre: [String: Any]?
}

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

enum CodingKeys: String, CodingKey {
    case albumName = "name"
    case artistName = "artistName"
    case artistUrl = "artistURL"
    case artworkURL = "artworkURL100"
}

struct feed: Codable {
    let results: [Result]?
}

struct appData: Codable {
    let feed: feed
}


class Networking: NSObject, XMLParserDelegate {
    
    func performNetworkTask<T: Codable>(type: T.Type, completion: ((_ response: T) -> Void)?) {
        // TODO: clean up parameters and constant outside of scope
        
        let feedURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json")
        
        guard let url = feedURL else {return}
        
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            
            guard let data = data else {
                return
            }
            
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded)
        }
        
        urlSession.resume()
    }
}



