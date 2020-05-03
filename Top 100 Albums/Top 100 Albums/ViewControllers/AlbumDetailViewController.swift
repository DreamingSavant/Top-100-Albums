//
//  AlbumDetailViewController.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import UIKit
import SafariServices


class AlbumDetailViewController: UIViewController {
    
    private let albumImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name of Album: "
        label.textColor = .yellow
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist: "
        label.textColor = .yellow
        label.numberOfLines = 0
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Genre: "
        label.textColor = .yellow
        label.numberOfLines = 0
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date Released: "
        label.textColor = .yellow
        label.numberOfLines = 0
        return label
    }()
    
    private let copyrightLabel: UILabel = {
        let label = UILabel()
        label.text = "Copyright: "
        label.textColor = .yellow
        label.numberOfLines = 0
        return label
    }()
    
    private let gotoAlbumSiteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Album on Apple Music", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didPressAlbumButton), for: .touchUpInside)
        return button
    }()
    
    private let detailStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public var viewModel: AlbumDetailViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            cache.downloadFrom(endpoint: viewModel.albumImageUrl) { [weak self] (data) in
                guard let data = data else { return }
                self?.albumImage.image = UIImage(data: data)
            }
            albumNameLabel.text? += viewModel.nameOfAlbum
            artistNameLabel.text? += viewModel.nameOfArtist
            genreLabel.text? += viewModel.genre
            releaseDateLabel.text? += viewModel.releaseDate
            copyrightLabel.text? += viewModel.copyright
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        setupDetailVC()
        
    }
    
    @objc func didPressAlbumButton(_ sender: UIButton) {
        if let url = URL(string: viewModel?.albumURL ?? "") {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    func setupDetailVC() {
        self.view.addSubview(albumImage)
        self.view.addSubview(detailStackView)
        detailStackView.addArrangedSubview(albumNameLabel)
        detailStackView.addArrangedSubview(artistNameLabel)
        detailStackView.addArrangedSubview(genreLabel)
        detailStackView.addArrangedSubview(releaseDateLabel)
        detailStackView.addArrangedSubview(copyrightLabel)
        
        self.view.addSubview(gotoAlbumSiteButton)
        
        NSLayoutConstraint.activate([
            albumImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            albumImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            albumImage.bottomAnchor.constraint(equalTo: self.detailStackView.topAnchor, constant: -20),
            
            detailStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            detailStackView.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 20),
            detailStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            detailStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            detailStackView.bottomAnchor.constraint(equalTo: gotoAlbumSiteButton.topAnchor, constant: -40),
            
            gotoAlbumSiteButton.heightAnchor.constraint(equalToConstant: 50),
            gotoAlbumSiteButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gotoAlbumSiteButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            gotoAlbumSiteButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            gotoAlbumSiteButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
        
    }
    
}
