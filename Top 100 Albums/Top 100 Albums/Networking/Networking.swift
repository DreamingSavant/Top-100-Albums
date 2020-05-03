//
//  AlbumRequest.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

class Networking: NSObject {
    
    func performNetworkTask<T: Codable>(type: T.Type, completion: ((_ response: T) -> Void)?) {
        
        let feedURL = URL(string: "https://rss.itunes.apple.com/api/v1/ca/apple-music/top-albums/all/100/explicit.json")
        
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
            print("There is data: \(data)")
            guard let decoded = response.decode(type) else {
                print("did not make it")
                return
            }
            print("made it")
            completion?(decoded)
        }
        
        urlSession.resume()
    }
}



