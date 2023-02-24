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
        ScrollView {
                LazyHStack(alignment: .center) {
                    ForEach(model.movies.topRated, id: \.self) { movie in
                        TopRatedCard(
                            Color.orange,
                            data: movie
                        )
                    }
                }
        }.onAppear {
            Task.init {
                await model.loadData()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
