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
    
    init(data: [Movie]) {
        self.movies = data
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(verbatim: "Popular Movies").fontWeight(.semibold)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(movies) { movie in
                        AsyncImage(
                            url: URL(string: movie.posterPath),
                            content: { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            },
                            placeholder: {
                                Color.purple
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
