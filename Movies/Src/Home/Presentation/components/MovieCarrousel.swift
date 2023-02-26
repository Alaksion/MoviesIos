//
//  TopRatedCard.swift
//  Movies
//
//  Created by Lucca Beurmann on 21/02/23.
//

import Foundation
import SwiftUI

struct MovieCarrousel: View {
    
    private let movies: [Movie]
    private let title: String
    private let loading: Bool
    
    init(data: [Movie], title: String, loading: Bool) {
        self.movies = data
        self.title = title
        self.loading = loading
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(
                verbatim: title
            )
            .fontWeight(.semibold)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    if(loading) {
                        LoadingView()
                    }
                    else {
                        ForEach(movies) { movie in
                            AsyncImage(
                                url: URL(string: movie.posterPath),
                                content: { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                },
                                placeholder: {
                                    ShimmerView()
                                }
                            )
                            .frame(width: 100, height: 150)
                            .cornerRadius(15)
                        }
                    }
                }
            }
        }
    }
    
    private struct LoadingView : View {
        var body: some View {
            ForEach((1...10).reversed(), id: \.self) { _ in
                ShimmerView()
                    .frame(width: 200, height: 300)
                    .cornerRadius(15)
                }
            }
        }
}
