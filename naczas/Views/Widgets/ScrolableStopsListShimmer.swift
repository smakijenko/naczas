//
//  ScrolableStopsListShimmer.swift
//  naczas
//
//  Created by Stanisław Makijenko on 30/03/2025.
//

import SwiftUI
import Shimmer

struct ScrolableStopsListShimmer: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                ForEach(0 ..< 15) { _ in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: screenSize.width / 2)
                        .frame(height: translucentTileSize / 2.5)
                        .foregroundStyle(.shimmerGray)
                        .shimmering(bandSize: 1)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ScrolableStopsListShimmer()
}
