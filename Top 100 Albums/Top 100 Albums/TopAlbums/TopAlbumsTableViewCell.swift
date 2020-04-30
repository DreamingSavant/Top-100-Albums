//
//  TopAlbumsView.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import UIKit

class TopAlbumsTableViewCell: UITableViewCell {
    
    public static let reuseIdentifier = "albumCellIdentifier"
    
    // TODO: Setup outlets

    // TODO: Setup constraints for outlets
    
    private let albumNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .purple
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let albumImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var viewModel: TopAlbumTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            albumNameLabel.text = viewModel.nameOfAlbum
            artistNameLabel.text = viewModel.nameOfArtist
            //setup method to turn url string to url to data and make optional
//            let imageURL = URL(string: viewModel.albumImageUrl)!
//            let imageData = try! Data(contentsOf: imageURL)
//            let image = UIImage(data: imageData)
            albumImage.image = convertImagestring(imageString: viewModel.albumImageUrl)
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
        self.addSubview(cellView)
        self.cellView.addSubview(albumImage)
        self.cellView.addSubview(albumNameLabel)
        self.cellView.addSubview(artistNameLabel)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            albumImage.centerYAnchor.constraint(equalTo:self.cellView.centerYAnchor),
            albumImage.leadingAnchor.constraint(equalTo:self.cellView.leadingAnchor, constant:10),
            albumImage.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            albumImage.widthAnchor.constraint(equalToConstant:70),
            albumImage.heightAnchor.constraint(equalToConstant:cellView.frame.height),
            
//            albumNameLabel.topAnchor.constraint(equalTo:self.cellView.topAnchor),
            albumNameLabel.centerYAnchor.constraint(equalTo: self.cellView.centerYAnchor),
            albumNameLabel.leadingAnchor.constraint(equalTo:self.albumImage.trailingAnchor, constant: 10),
            albumNameLabel.trailingAnchor.constraint(equalTo:self.cellView.trailingAnchor),
            
            artistNameLabel.topAnchor.constraint(equalTo:self.albumNameLabel.bottomAnchor),
            artistNameLabel.leadingAnchor.constraint(equalTo:self.albumImage.trailingAnchor, constant: 10),
            artistNameLabel.bottomAnchor.constraint(equalTo: self.cellView.bottomAnchor)
        ])
    }
    
    private func convertImagestring(imageString: String?) -> UIImage? {
        guard let imageString = imageString else {return nil}
        guard let imageURL = URL(string: imageString) else {return nil}
        guard let imageData = try? Data(contentsOf: imageURL) else {return nil}
        let image = UIImage(data: imageData)
        return image
    }
}
