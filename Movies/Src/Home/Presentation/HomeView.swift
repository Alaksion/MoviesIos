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
        switch(model.viewState) {
        case .content:
            ContentView(data: model.movies)
        case .loading:
            ProgressView().onAppear {
                Task.init {
                    await model.loadData()
                }
            }
        case .error(let error):
            Spacer()
        }
    }
    
    private struct ContentView: View {
        private let state: AggregatedMovies
        
        init(data: AggregatedMovies) {
            self.state = data
        }
        
        var body: some View {
            ScrollView(.vertical) {
                LazyVStack(spacing: 20) {
                    PopularCarrousel(data: state.popular)
                    MovieCarrousel(data: state.topRated, title: "Audience favorites")
                    MovieCarrousel(data: state.nowPlaying, title: "Now Playing")
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
