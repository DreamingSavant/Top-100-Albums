//
//  AlbumDetailViewModel.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/29/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation


// TODO: Setup an image, info shown on the cell plus genre, release date, and copyright info below the image. A button should also be included to point to album website

class AlbumDetailViewModel {
    
    var result: Results?
    var genres: Genres?
    
    public var nameOfAlbum: String {
        return result?.albumName ?? ""
    }
    
    public var nameOfArtist: String {
        return result?.artistName ?? ""
    }
    
    public var albumImageUrl: String {
        // change string to data type??
        return result?.artworkURL ?? ""
    }
    // TODO: add missing variables in structs file. album url etc
    
    public var artistURL: String {
        return result?.artistUrl ?? ""
    }
    
    public var genre: String {
        return genres?.genreName ?? ""
    }
    
    public var releaseDate: String {
        return result?.releaseDate ?? ""
    }
    
    public var copyright: String {
        return result?.copyright ?? ""
    }

}
