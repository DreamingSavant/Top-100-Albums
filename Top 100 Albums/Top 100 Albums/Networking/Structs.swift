//
//  EndpointType.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

    struct Top100Albums: Codable {
        let feed: Feed
        
        private enum CodingKeys: String, CodingKey {
            case feed = "feed"
        }
    }

    struct Feed: Codable {
        let results: [Results]

        private enum CodingKeys: String, CodingKey {
            case results = "results"
        }
    }

    struct Results: Codable {
        let artistName: String?
        let albumName: String?
        let artistUrl: String?
        let artworkURL: String?
        let albumURL: String?
        
        private enum CodingKeys: String, CodingKey {
            case artistName = "artistName"
            case albumName = "name"
            case artistUrl = "artistUrl"
            case artworkURL = "artworkUrl100"
            case albumURL = "url"
        }
    }
