//
//  MovieModel.swift
//  Movies
//
//  Created by Lucca Beurmann on 23/02/23.
//

import Foundation

struct MovieListModel: Decodable {
    let page: Int
    let results: [MovieModel]
}

struct MovieModel: Decodable {
    let id: Int
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
    }
}
