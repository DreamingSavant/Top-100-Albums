//
//  ViewController.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import UIKit

var activityIndicator = UIActivityIndicatorView()

class TopAlbumsTableViewController: UITableViewController {
    
    private let viewModel = TopAlbumsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.backgroundColor = .gray
        title = "Top 100 Music Albums"
        setupTableView()
        viewModel.getMostPopularAlbums { [weak self] in
            DispatchQueue.main.async {
                self?.tableView?.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopAlbumsTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? TopAlbumsTableViewCell else {
                                                        return UITableViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsViewModel = viewModel.detailsViewModel(for: indexPath.row)
        let vc = AlbumDetailViewController()
        vc.viewModel = detailsViewModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TopAlbumsTableViewCell.self, forCellReuseIdentifier: TopAlbumsTableViewCell.reuseIdentifier)
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}

