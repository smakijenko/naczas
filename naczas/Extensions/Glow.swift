//
//  Glow.swift
//  naczas
//
//  Created by Stanisław Makijenko on 19/02/2025.
//

import Foundation
import SwiftUI

struct Glow: ViewModifier {
    @State var isAnimating: Bool = false
    let radius: CGFloat
    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isAnimating ? radius : 0)
                .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)
                .onAppear {
                    isAnimating.toggle()
                }
            content
        }
    }
}

extension View {
    func glow(radius: CGFloat) -> some View {
        modifier(Glow(radius: radius))
    }
}
