//
//  TopAlbumnsViewModel.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import Foundation

class TopAlbumsViewModel {
    /// access to the service calling class
    private let networking: NetworkingProtocol
    
    /// values obtained from the service call accessible here
    private var results: Feed?
    
    init(_ networking: NetworkingProtocol = Networking()) {
        self.networking = networking
    }
    
    ///Service call if successful will store recieved data into private results variable
    public func getMostPopularAlbums(completion: (() -> Void)?) {
        networking.performNetworkTask(type: Top100Albums.self) { [weak self] (response) in
            switch response {
            case .success(let albumResults):
                self?.results = albumResults.feed
                completion?()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    /**
     This method is used to create the tableview cells with their respective values.
     
        - Parameters:
            - index: The index in which the values are stored
        - Returns: Sends the values for each cell to TopAlbumTableViewCellModel to be added to their respective cells
 */
    public func cellViewModel(index: Int) -> TopAlbumTableViewCellModel? {
        guard let results = results else { return nil }
        let topAlbumsTableViewCell = TopAlbumTableViewCellModel(result: results.results[index])
        return topAlbumsTableViewCell
    }
    
    ///Count used to tell the tableView how many cells to expect
    public var count: Int {
        guard let results = results else { return 0 }
        return results.results.count
    }
    
    /**
        This method tells the next screen which album should be displayed along with its info
     
        - Parameters:
            - index: Gives the indexPath.row of the selected cell
        - Returns: Sends the Required values to display  in the Details screen to the DetailViewModel
     */
    public func detailsViewModel(for index: Int) -> AlbumDetailViewModel? {
        guard let results = results else { return nil }
        return AlbumDetailViewModel(result: results.results[index])
    }
    
    
}
