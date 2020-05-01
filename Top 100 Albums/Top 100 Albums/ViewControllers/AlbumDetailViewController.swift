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
        image.backgroundColor = .black
        image.image = UIImage(named: "Screen Shot 2019-12-30 at 10.24.12 AM")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let albumName: UILabel = {
        let label = UILabel()
        label.text = "Name of Album:"
        label.textColor = .yellow
        return label
    }()
    
    private let artistName: UILabel = {
        let label = UILabel()
        label.text = "Artist:"
        label.textColor = .yellow
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date Released:"
        label.textColor = .yellow
        return label
    }()
    
    private let copyrightLabel: UILabel = {
        let label = UILabel()
        label.text = "Copyright:"
        label.textColor = .yellow
        return label
    }()
    
    private let gotoAlbumSiteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Test", for: .normal)
        button.titleLabel?.textColor = .blue
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
        stack.backgroundColor = .blue
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public var viewModel: AlbumDetailViewModel? {
    didSet {
        albumImage.image = convertImagestring(imageString: viewModel?.albumImageUrl)
        albumName.text? += "win"
        artistName.text? += "win"
        releaseDateLabel.text? += "win"
        copyrightLabel.text? += "win"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple //test
        setupDetailVC()
        
    }
    
    @objc func didPressAlbumButton(_ sender: UIButton) {
        if let url = URL(string: "https://www.hackingwithswift.com") { // we would ask for the viewmodel.album url in this method
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    func setupDetailVC() {
        self.view.addSubview(albumImage)
        self.view.addSubview(detailStackView)
        detailStackView.addArrangedSubview(albumName)
        detailStackView.addArrangedSubview(artistName)
        detailStackView.addArrangedSubview(releaseDateLabel)
        detailStackView.addArrangedSubview(copyrightLabel)
        
        self.view.addSubview(gotoAlbumSiteButton)
        
        albumImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        albumImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        albumImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        albumImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true//temp
        albumImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        albumImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        detailStackView.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 20).isActive = true
        detailStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        detailStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        detailStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true//temp
        detailStackView.bottomAnchor.constraint(equalTo: gotoAlbumSiteButton.topAnchor, constant: -60).isActive = true
        
        gotoAlbumSiteButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        gotoAlbumSiteButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        gotoAlbumSiteButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        gotoAlbumSiteButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true//temp
    }
    
}
