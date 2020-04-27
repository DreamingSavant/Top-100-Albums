//
//  TopAlbumnsViewModel.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation


class TopAlbumsViewModel {
    
    private let networking = Networking()
    
    private var results: Results?
    
    private let album: Album? = nil
    
    public var nameOfAlbum: String {
        return album?.nameOfAlbum ?? ""
    }
    
    public var nameOfArtist: String {
        return album?.nameOfArtist ?? ""
    }
    
    public var albumImageUrl: String {
        
        // TODO: return url or uiimage from url later
        return album?.albumArtURL ?? ""
    }
    
    public func getMostPopularAlbums(completion: (() -> Void)?) {
        networking.performNetworkTask(type: Results.self) { [weak self] response in
            self?.results = response
            completion?()
        }
    }
    
    public func cellViewModel(index: Int) -> TopAlbumTableViewCellModel? {
        guard let results = results else { return nil }
        let topAlbumsTableViewCell = TopAlbumTableViewCellModel(result: results.albums[index])
        return topAlbumsTableViewCell
    }
    
    public var count: Int {
        return results?.albums.count ?? 0
    }
    
    public func selectedAlbum(index: Int) -> String {
        return results?.albums[index].albumName ?? ""
    }
}
