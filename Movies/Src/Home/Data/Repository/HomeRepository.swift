//
//  HomeRepository.swift
//  Movies
//
//  Created by Lucca Beurmann on 23/02/23.
//

import Foundation
import Caravel

protocol HomeRepositoryProtocol {
    func getPopularMovies() async throws-> [Movie]
    func getNowPlayingMovies() async throws-> [Movie]
    func getTopRated() async throws-> [Movie]
}

struct HomeRepository: HomeRepositoryProtocol {
    
    private let httpClient: CaravelClient
    
    init(client : CaravelClient) {
        self.httpClient = client
    }
    
    func getPopularMovies() async throws -> [Movie] {
        let data: MovieListModel = try await httpClient.sendRequest(data: HomeService.popular)
        
        return data.results.map { MovieModel in
            Movie(from: MovieModel)
        }
    }
    
    func getNowPlayingMovies() async throws -> [Movie] {
        let data: MovieListModel = try await httpClient.sendRequest(data: HomeService.nowPlaying)
        
        return data.results.map { MovieModel in
            Movie(from: MovieModel)
        }
    }
    
    func getTopRated() async throws -> [Movie] {
        let data: MovieListModel = try await httpClient.sendRequest(data: HomeService.topRated)
        
        return data.results.map { MovieModel in
            Movie(from: MovieModel)
        }
    }
}
