//
//  TopRatedCard.swift
//  Movies
//
//  Created by Lucca Beurmann on 21/02/23.
//

import Foundation
import SwiftUI

struct TopRatedCard: View {
    
    private let background: Color
    private let movie: Movie
    
    init(_ color: Color, data: Movie) {
        self.background = color
        self.movie = data
    }
    
    var body: some View {
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
        .frame(width: 150, height: 200)
        .cornerRadius(20)
    }
    
}
