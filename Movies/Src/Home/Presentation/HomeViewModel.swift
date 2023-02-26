//
//  HomeViewModel.swift
//  Movies
//
//  Created by Lucca Beurmann on 23/02/23.
//

import Foundation
import Caravel

class HomeViewModel: ObservableObject {
    
    private let repository: HomeRepositoryProtocol
    private let aggregator: HomeAggregatorProtocol
    
    init() {
        self.repository = HomeRepository(client: CaravelClient.instance)
        self.aggregator = HomeAggregator(self.repository)
    }
    
    @Published var movies: AggregatedMovies = AggregatedMovies.empty
    @Published var isLoading: Bool = false
    
    func loadData() async {
        await loadMovies()
    }
    
    @MainActor
    private func loadMovies() async {
        do {
            isLoading = true
            let response = try await aggregator.loadAggregatedData()
            self.movies = response
        } catch let error {
            debugPrint(error)
        }
        self.isLoading = false
    }
}
