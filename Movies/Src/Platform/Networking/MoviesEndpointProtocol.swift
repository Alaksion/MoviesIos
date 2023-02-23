//
//  MoviesEndpointProtocol.swift
//  Movies
//
//  Created by Lucca Beurmann on 22/02/23.
//

import Foundation
import Caravel

protocol MoviesEndpointProtocol : EndpointProtocol {}

extension MoviesEndpointProtocol {
    var baseURL: String { "https://api.themoviedb.org/3" }
}
