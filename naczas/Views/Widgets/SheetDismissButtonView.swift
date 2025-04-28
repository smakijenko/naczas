//
//  SheetDismissButtonView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 22/04/2025.
//

import SwiftUI

struct SheetDismissButtonView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            touchVibrates.impactOccurred()
            dismiss()
        } label: {
            Image(systemName: "arrow.down")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .minimumScaleFactor(0.1)
                .foregroundStyle(.white)
                .frame(width: 50, height: 40)
                .background(customThinTranslucentMaterial)
                .cornerRadius(10)
                .padding(.horizontal, 17)
        }
    }
}

#Preview {
    SheetDismissButtonView()
}
