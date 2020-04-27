//
//  TopAlbumsView.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import UIKit

class TopAlbumsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "albumCellIdentifier"
    
    // TODO: Setup outlets
    @IBOutlet weak var albumName: UILabel?
    @IBOutlet weak var artistOfAlbum: UILabel?
    @IBOutlet weak var albumArt: UIImage?
    // TODO: Setup constraints for outlets
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var viewModel: TopAlbumTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            print("yoo")
            albumName?.text = viewModel.nameOfAlbum
            artistOfAlbum?.text = viewModel.nameOfArtist
//            albumArt = viewModel.albumImageUrl
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
//    func setupAlbumData(album: Album) {
//        self.albumName?.text = album.nameOfAlbum
//        self.artistOfAlbum?.text = album.nameOfArtist
//        // TODO: Safely transform the image string to url to data
//        var albumImageData = URL(string: album.albumArtURL ?? "")
////        self.albumArt = UIImage(data: Data(contentsOf: albumImageData ?? ))
//    }
}
