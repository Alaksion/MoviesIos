//
//  HomeAggregator.swift
//  Movies
//
//  Created by Lucca Beurmann on 24/02/23.
//

import Foundation
import Caravel

protocol HomeAggregatorProtocol {
    func loadAggregatedData() async throws -> AggregatedMovies
}

struct HomeAggregator : HomeAggregatorProtocol {
    
    private let repository: HomeRepositoryProtocol
    
    init(_ repo: HomeRepositoryProtocol) {
        self.repository = repo
    }
    
    func loadAggregatedData() async throws -> AggregatedMovies {
        let popular  = try await repository.getPopularMovies()
        let topRated = try await repository.getTopRated()
        let nowPlaying = try await repository.getNowPlayingMovies()
        
        return AggregatedMovies(
            topRated: topRated, popular: popular, nowPlaying: nowPlaying
        )
    }
    
}
