//
//  AlbumDetailViewModel.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/29/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

class AlbumDetailViewModel {
    /// Results from the selected cell stored here for access
    var result: Results
    /// The Genres of the selected cell stored here for access
    var genres: Genres
    
    /**
        Initializes  the Result and genre of the selected cell to populate the detailsViewController
            - Parameters:
                    - result: Results of the selected Album cell
                    - genres: The Genre(s) of the selected Album cell
     */
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
