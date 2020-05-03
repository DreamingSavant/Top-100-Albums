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
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let detailStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let albumImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
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
            cache.downloadFrom(endpoint: viewModel.albumImageUrl) { [weak self] (data) in
                guard let data = data else { return }
                self?.albumImage.image = UIImage(data: data)
            }
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
        self.cellView.addSubview(detailStackView)
        self.detailStackView.addArrangedSubview(albumNameLabel)
        self.detailStackView.addArrangedSubview(artistNameLabel)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            albumImage.centerYAnchor.constraint(equalTo:self.cellView.centerYAnchor),
            albumImage.leadingAnchor.constraint(equalTo:self.cellView.leadingAnchor, constant:10),
            albumImage.bottomAnchor.constraint(equalTo: self.cellView.bottomAnchor, constant: -10),
            albumImage.topAnchor.constraint(equalTo: self.cellView.topAnchor, constant: 10),
            albumImage.widthAnchor.constraint(equalToConstant:70),
            
            detailStackView.topAnchor.constraint(equalTo: self.albumImage.topAnchor),
            detailStackView.bottomAnchor.constraint(equalTo: self.albumImage.bottomAnchor),
            detailStackView.centerYAnchor.constraint(equalTo: self.cellView.centerYAnchor),
            detailStackView.leadingAnchor.constraint(equalTo: self.albumImage.trailingAnchor, constant: 10),
            detailStackView.trailingAnchor.constraint(equalTo: self.cellView.trailingAnchor, constant: -20)
        ])
    }
    
}

