//
//  TopAlbumTableViewCellModel.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation


class TopAlbumTableViewCellModel {
    
    private let result: Result
    
    init(result: Result) {
        self.result = result
    }
    
    public var nameOfAlbum: String {
           return result.albumName
          }
          
          public var nameOfArtist: String {
           return result.artistName
          }
          
          public var albumImageUrl: String {
              
              // TODO: return url or uiimage from url later
           return result.artworkURL!
          }
}
