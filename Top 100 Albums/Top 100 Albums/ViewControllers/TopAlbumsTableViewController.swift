//
//  ViewController.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import UIKit

class TopAlbumsTableViewController: UITableViewController {
    
    private let viewModel = TopAlbumsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
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
        //TODO: Setup transition to detail VC and passing data to detailVM
        
//        let detailsViewModel = 
//        print("Hey now!")
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(TopAlbumsTableViewCell.self, forCellReuseIdentifier: TopAlbumsTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -500).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

