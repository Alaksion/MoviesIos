//
//  HomeRepository.swift
//  Movies
//
//  Created by Lucca Beurmann on 23/02/23.
//

import Foundation
import Caravel

protocol HomeRepositoryProtocol {
    func getPopularMovies() async -> Result<[Movie], RequestError>
}

struct HomeRepository: HomeRepositoryProtocol {
    
    private let httpClient: HttpClientProtocol
    
    init(client : HttpClientProtocol) {
        self.httpClient = client
    }
    
    func getPopularMovies() async -> Result<[Movie], RequestError> {
        let data: Result<MovieListModel, RequestError> = await httpClient.sendRequest(endpoint: HomeService.popular)
        
        return handleResponse(result: data) { rawMovies in
            rawMovies.results.map { model in
                Movie(from: model)
            }
        }
    }
}
