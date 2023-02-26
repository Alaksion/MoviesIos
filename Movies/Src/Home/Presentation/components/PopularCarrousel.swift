//
//  PopularCarrousel.swift
//  Movies
//
//  Created by Lucca Beurmann on 25/02/23.
//

import Foundation
import SwiftUI

struct PopularCarrousel: View {
    
    private let movies: [Movie]
    private let loading: Bool
    
    init(data: [Movie], loading: Bool) {
        self.movies = data
        self.loading = loading
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(verbatim: "Popular Movies").fontWeight(.semibold)
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
                            .frame(width: 200, height: 300)
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
