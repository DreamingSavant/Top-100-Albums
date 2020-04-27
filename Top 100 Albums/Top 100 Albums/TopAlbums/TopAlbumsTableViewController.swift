//
//  ViewController.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import UIKit

class TopAlbumsTableViewController: UITableViewController {
    
    @IBOutlet weak var albumTableView: UITableView?
    
    private let viewModel = TopAlbumsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        viewModel.getMostPopularAlbums { [weak self] in
//            DispatchQueue.main.async {
//                self?.albumTableView?.reloadData()
//                print("yooo \(self?.viewModel.nameOfAlbum ?? "no album")")
//            }
            let feedURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json")
            
            guard let url = feedURL else {return}
            
            let urlRequest = URLRequest(url: url)
            
            let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
                if let _ = error {
                    return
                }
                
                let decoder = JSONDecoder()
                guard let data = data else {
                    return
                }
                do {
                    let termFeed = try decoder.decode(Result.self, from: data)
                    print(termFeed)
                } catch {
                    print("Error parsing the data")
                }
//                let response = Response(data: data)
//                guard let decoded = response.decode(Result.self) else {
//                    return
//                }
//                completion?(decoded)
            }
            
            urlSession.resume()
//        }
        
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

        return UITableViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destionationViewController = segue.destination as? AlbumDetailViewController
    }
 
}

