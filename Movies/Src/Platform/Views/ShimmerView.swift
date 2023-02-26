//
//  ShimmerView.swift
//  Movies
//
//  Created by Lucca Beurmann on 25/02/23.
//

import Foundation
import SwiftUI

struct ShimmerView: View {
    
    private let duration: Double = 0.9
    private let minOpacity: Double = 0.25
    private let maxOpacity: Double = 1.0
    private let cornerRadius: CGFloat = 2.0
    
    @State private var opacity: CGFloat
    
    init() {
        self.opacity = maxOpacity
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .opacity(self.minOpacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeOut(duration: duration)
                let repeatAnimation = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeatAnimation) {
                    self.opacity = maxOpacity
                }
            }
    }
    
}
