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
    
    init(data: [Movie], title: String) {
        self.movies = data
        self.title = title
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(
                verbatim: title
            )
            .fontWeight(.semibold)
            
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
                        .frame(width: 100, height: 150)
                        .cornerRadius(15)
                    }
                }
            }
        }
    }
}
