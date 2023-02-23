//
//  HomeRepository.swift
//  Movies
//
//  Created by Lucca Beurmann on 23/02/23.
//

import Foundation
import Caravel

protocol HomeRepositoryProtocol {
    func getPopularMovies() async -> Result<[MovieModel], RequestError> 
}

struct HomeRepository: HomeRepositoryProtocol {
    
    private let httpClient: HttpClientProtocol
    
    init(client : HttpClientProtocol) {
        self.httpClient = client
    }
    
    func getPopularMovies() async -> Result<[MovieModel], RequestError> {
        return await httpClient.sendRequest(endpoint: HomeService.popular)
    }
}
