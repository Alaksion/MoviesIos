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
        ScrollView(.vertical) {
            LazyVStack(spacing: 20) {
                PopularCarrousel(data: model.movies.popular)
                MovieCarrousel(data: model.movies.topRated, title: "Audience favorites")
                MovieCarrousel(data: model.movies.nowPlaying, title: "Now Playing")
            }.onAppear {
                Task.init {
                    await model.loadData()
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
