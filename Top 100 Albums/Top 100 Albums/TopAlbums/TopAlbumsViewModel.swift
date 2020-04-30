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
    
    private var results: Feed?
    
    public func getMostPopularAlbums(completion: (() -> Void)?) {
        networking.performNetworkTask(type: Top100Albums.self) { [weak self] (response) in
//            print("This is the response: \(response.feed)")
            self?.results = response.feed
//            print("Here are the results of parsing, : ")
            completion?()
        }
    }
    
    public func cellViewModel(index: Int) -> TopAlbumTableViewCellModel? {
        guard let results = results else { return nil }
        let topAlbumsTableViewCell = TopAlbumTableViewCellModel(result: results.results[index])
        print("This is what we see from the repo: \(results.results[index])")
        return topAlbumsTableViewCell
    }
    
    public var count: Int {
        guard let results = results else { return 0 }
        print("Here \(results.results.count)")
        return results.results.count
    }
    
    public func selectedAlbum(index: Int) -> String {
        guard let results = results else { return "none at all" }
        return results.results[index].albumName!
    }
}
