//
//  AlbumDetailViewModel.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/29/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

class AlbumDetailViewModel {
    
    var result: Results
    var genres: Genres
    
    init(result: Results, genres: Genres){
        self.result = result
        self.genres = genres
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
    
    public var genre: String {
        return genres.genreName ?? ""
    }
    public var albumURL: String {
        return result.albumURL ?? ""
    }
    
    public var releaseDate: String {
        return result.releaseDate ?? ""
    }
    
    public var copyright: String {
        return result.copyright ?? ""
    }
    
}
