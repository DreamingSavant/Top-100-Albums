//
//  CacheManager.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 5/3/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

typealias DataHandler = (Data?) -> Void
let cache = CacheManager.shared

final class CacheManager {
    private let cache = NSCache<NSString, NSData>()
    
    static let shared = CacheManager()
    private init() {}
    /**
        Downloads the image data from the given image url
     
      - Parameters:
            - endpoint: string of the image url
            - completion:
     - Returns: The data of the image url for use
     */
    func downloadFrom(endpoint: String, completion: @escaping DataHandler) {
        if let data = cache.object(forKey: endpoint as NSString) {
            completion(data as Data)
            return
        }
        
        guard let url = URL(string: endpoint) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Bad Task: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data {
                self.cache.setObject(data as NSData, forKey: endpoint as NSString)
                
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }.resume()
    }
}
