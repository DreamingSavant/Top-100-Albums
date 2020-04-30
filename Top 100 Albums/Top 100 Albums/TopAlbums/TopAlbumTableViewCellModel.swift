//
//  TopAlbumTableViewCellModel.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation


class TopAlbumTableViewCellModel {
    
    private let result: Results
    
    init(result: Results) {
        self.result = result
    }
    
    public var nameOfAlbum: String {
        return result.albumName ?? ""
          }
          
          public var nameOfArtist: String {
            return result.artistName ?? ""
          }
          
          public var albumImageUrl: String {
            // change string to data type??
           return result.artworkURL!
          }
    // TODO: add missing variables in structs file. album url etc
    
    public var artistURL: String {
        return result.artistUrl ?? ""
    }
        
}
