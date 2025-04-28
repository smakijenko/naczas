//
//  StopAnnotation.swift
//  naczas
//
//  Created by Stanisław Makijenko on 24/04/2025.
//

import SwiftUI

struct StopAnnotation: View {
    @State private var isIconAnimating: Bool = false
    let isTram: Bool
    let isSelectedStop: Bool
    var body: some View {
        ZStack {
            Image("BusTramStopPinBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15)
            Image(systemName: isTram ? "tram.fill" : "bus.fill")
                .foregroundStyle(.black)
                .font(.system(size: 6))
                .offset(y: -3)
        }
        .scaleEffect(isSelectedStop ? 1.35 : 1)
        .offset(y: isIconAnimating ? -7 : 0)
        .onAppear {
            if isSelectedStop {
                isIconAnimating = true
            }
        }
        .animation(.easeIn(duration: 0.35).delay(0.35).repeatForever(), value: isIconAnimating)
    }
}

#Preview {
    ZStack {
        Rectangle().fill(Color.red.opacity(0.2))
        StopAnnotation(isTram: false, isSelectedStop: true)
    }
}
