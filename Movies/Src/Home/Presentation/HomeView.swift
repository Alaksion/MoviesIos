//
//  HomeView.swift
//  Movies
//
//  Created by Lucca Beurmann on 21/02/23.
//

import Foundation
import SwiftUI
import Caravel

struct HomeView: View {

    @State private var topRatedMovies: [Movie] = []
    
    @ObservedObject private var model = HomeViewModel()
    
    var body: some View {
        ContentView(
            data: model.movies,
            loading: model.isLoading
        ).onAppear {
            Task {
                await model.loadData()
            }
        }
    }
    
    private struct ContentView: View {
        private let state: AggregatedMovies
        private let isLoading: Bool
        
        init(data: AggregatedMovies, loading: Bool) {
            self.state = data
            self.isLoading = loading
        }
        
        var body: some View {
            ScrollView(.vertical) {
                LazyVStack(spacing: 20) {
                    PopularCarrousel(data: state.popular, loading: isLoading)
                    MovieCarrousel(data: state.topRated, title: "Audience favorites", loading: isLoading)
                    MovieCarrousel(data: state.nowPlaying, title: "Now Playing", loading: isLoading)
                }
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
