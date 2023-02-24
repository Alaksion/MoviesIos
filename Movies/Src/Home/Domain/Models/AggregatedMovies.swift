//
//  AggregatedMovies.swift
//  Movies
//
//  Created by Lucca Beurmann on 24/02/23.
//

import Foundation

struct AggregatedMovies {
    let topRated: [Movie]
    let popular: [Movie]
    let nowPlaying: [Movie]
    
    static let empty = AggregatedMovies(
        topRated: [], popular: [], nowPlaying: []
    )
}
