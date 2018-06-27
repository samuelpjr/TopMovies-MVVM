//
//  MoviesClient.swift
//  TopMovies-MVVM
//
//  Created by Samuel Pinheiro Junior on 15/06/2018.
//  Copyright © 2018 Samuel Pinheiro Junior. All rights reserved.
//

import UIKit

struct Trending: Decodable {
    let title : String
}

class MoviesClient: NSObject {
    
    func fetchMovies(completion: @escaping (String) -> () ){
        let jsonstring = "https://private-anon-2443095610-trakt.apiary-mock.com/movies/popular"
        guard let url = URL(string: jsonstring) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            if err != nil {
                print("err: \(String(describing: err))")
            }
            do{
                let films = try JSONDecoder().decode([Trending].self, from: data)
                    for movies in films{
                        completion(movies.title)
                    }
            } catch let jsonerr {
                print("Error serialising: ", jsonerr)
            }
        }.resume()
    }
}
