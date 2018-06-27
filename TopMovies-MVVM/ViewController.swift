//
//  ViewController.swift
//  TopMovies-MVVM
//
//  Created by Samuel Pinheiro Junior on 15/06/2018.
//  Copyright © 2018 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var viewModel : ViewModel!
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovies {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureCell(cell: cell, forRowAtIndexPath: indexPath)
        return cell
    }

    func configureCell(cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        cell.textLabel?.text = viewModel.titleForItem(at: indexPath)
    }
}

