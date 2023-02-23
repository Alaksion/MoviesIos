//
//  MovieModel.swift
//  Movies
//
//  Created by Lucca Beurmann on 23/02/23.
//

import Foundation

struct MovieModel: Decodable {
    let id: Int
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
    }
}
