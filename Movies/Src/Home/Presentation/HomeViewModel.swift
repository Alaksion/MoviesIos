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
    @Published var viewState: ViewState = ViewState.loading
    
    func loadData() async {
        await topRatedMovies()
    }
    
    @MainActor
    private func topRatedMovies() async {
        do {
            movies = try await aggregator.loadAggregatedData()
            viewState = ViewState.content
        } catch let error {
            viewState = ViewState.error(errorData: error)
        }
    }

}
