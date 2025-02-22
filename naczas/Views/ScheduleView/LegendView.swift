//
//  LegendView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 19/02/2025.
//

import SwiftUI

struct LegendView: View {
    @Binding var isOnlineTransportLoaded: Bool
    var body: some View {
        ZStack {
            if isOnlineTransportLoaded {
                HStack(spacing: 10) {
                    HStack {
                        shiningLine(color: .green)
                        Text("- W ruchu")
                    }
                    HStack {
                        shiningLine(color: .red)
                        Text("- Brak pojazdów")
                    }
                }
                .foregroundStyle(.white)
                .font(.system(size: 17))
            }
            else {
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: translucentTileSize / 2)
    }
}

#Preview {
    LegendView(isOnlineTransportLoaded: .constant(false))
}

extension LegendView {
    private func shiningLine(color: Color) -> some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(color)
                .frame(width: 50, height: 5)
                .glow()
        }
    }
}
