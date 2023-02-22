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
    
    init(_ color: Color) {
        self.background = color
    }
    
    var body: some View {
        Image(systemName: "sun.max")
            .padding(.horizontal, 80)
            .padding(.vertical, 100)
            .background(background)
            .cornerRadius(10)
    }
    
}
