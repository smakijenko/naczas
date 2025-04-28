//
//  BusTramAnnotation.swift
//  naczas
//
//  Created by Stanisław Makijenko on 24/04/2025.
//

import SwiftUI

struct BusTramAnnotation: View {
    let isTram: Bool
    var body: some View {
        Image(systemName: isTram ? "tram.fill" : "bus.fill")
            .font(.system(size: 15))
            .foregroundColor(.yellow)
    }
}

#Preview {
    BusTramAnnotation(isTram: true)
}
