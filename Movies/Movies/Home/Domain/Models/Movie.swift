//
//  Movie.swift
//  Movies
//
//  Created by Lucca Beurmann on 23/02/23.
//

import Foundation

struct Movie {
    let id: Int
    let posterPath: String
    
    init(from movieModel : MovieModel) {
        self.id = movieModel.id
        self.posterPath = movieModel.posterPath
    }
}
