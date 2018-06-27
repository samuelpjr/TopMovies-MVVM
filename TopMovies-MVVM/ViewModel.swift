//
//  ViewModel.swift
//  TopMovies-MVVM
//
//  Created by Samuel Pinheiro Junior on 15/06/2018.
//  Copyright © 2018 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    @IBOutlet var moviesClient: MoviesClient!
    var movies : [Any] = []
    
    func fetchMovies(completion: @escaping () -> ()){
        moviesClient.fetchMovies { movies in
            self.movies.append(movies)
            completion()
        }
    }
    
    func numberOfItems(in section: Int) -> Int {
        return movies.count
    }
    
    func titleForItem(at indexPath: IndexPath) -> String {
        return movies[indexPath.row] as! String
    }
}
