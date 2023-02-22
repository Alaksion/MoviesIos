//
//  HomeView.swift
//  Movies
//
//  Created by Lucca Beurmann on 21/02/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView {
                LazyHStack(alignment: .center) {
                    ForEach(1...10, id: \.self) { id in
                        TopRatedCard(
                            id % 2 == 0 ? Color.red : Color.orange
                        )
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
