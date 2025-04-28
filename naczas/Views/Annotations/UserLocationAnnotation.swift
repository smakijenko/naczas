//
//  UserLocationAnnotation.swift
//  naczas
//
//  Created by Stanisław Makijenko on 22/04/2025.
//

import SwiftUI

struct UserLocationAnnotation: View {
    @State private var isUserIconAnimating = false
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.white)
                .frame(width: 22)
            Circle()
                .fill(Color.blue)
                .frame(width: 15)
                .scaleEffect(isUserIconAnimating ? 0.85 : 1)
        }
        .onAppear {
            isUserIconAnimating = true
        }
        .animation(.linear(duration: 1).delay(0.75).repeatForever(), value: isUserIconAnimating)
    }
}

#Preview {
    UserLocationAnnotation()
}
