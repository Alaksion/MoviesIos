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
    
    private let repository = HomeRepository(client: HttpClient.instance)
    
    var body: some View {
        ScrollView {
                LazyHStack(alignment: .center) {
                    ForEach(1...10, id: \.self) { id in
                        TopRatedCard(
                            id % 2 == 0 ? Color.red : Color.orange
                        )
                    }
                }
        }.onAppear {
            Task {
                let data = await repository.getPopularMovies()
                debugPrint(data)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
