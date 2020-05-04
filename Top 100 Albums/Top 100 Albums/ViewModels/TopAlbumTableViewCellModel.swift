//
//  TopAlbumTableViewCellModel.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation


class TopAlbumTableViewCellModel {
    
    /// Values that will populate each cell will be stored in this result struct
    private let result: Results
    
    /**
     Initializes a new list of results to populate each cell
     - Parameters:
        - result: contains the list for each album containing the name of the album, artist name, and an album image
     */
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
        return result.artworkURL ?? ""
    }
    
}
