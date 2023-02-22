//
//  HomeService.swift
//  Movies
//
//  Created by Lucca Beurmann on 22/02/23.
//

import Foundation
import Caravel

enum HomeService {
    
    case popular
    case nowPlaying
    case topRated
    
}

extension HomeService : MoviesEndpointProtocol {
    
    var path: String {
        switch(self) {
        case .popular:
            return "/movie/popular"
        case .nowPlaying:
            return "movie/now_playing"
        case .topRated:
            return "movie/top_rated"
        }
    }
    
    var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    var queries: [String : String] {
        // Add API_KEY to every request query map.
        var queryMap: [String: String] = [:]
        queryMap["api_key"] = "value"
        
        return queryMap
    }
    
}
