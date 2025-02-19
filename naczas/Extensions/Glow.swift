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
    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isAnimating ? 15 : 0)
                .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)
                .onAppear {
                    isAnimating.toggle()
                }
            content
        }
    }
}

extension View {
    func glow() -> some View {
        modifier(Glow())
    }
}
