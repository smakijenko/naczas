//
//  LineSearcherView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 17/02/2025.
//

import SwiftUI

struct LineSearcherView: View {
    @StateObject private var searchVm = LineSearcherViewModel()
    @Binding var isCityPickerShown: Bool
    var body: some View {
        HStack(spacing: 0) {
            if !isCityPickerShown {
                searchField
            }
            Button {
                touchVibrates.impactOccurred()
                withAnimation(.easeInOut(duration: 0.2)) {
                    isCityPickerShown = false
                }
            } label: {
                loupeIcon
            }
        }
        .background(.gray.opacity(0.3))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    LineSearcherView(isCityPickerShown: .constant(false))
}

extension LineSearcherView {
    private var loupeIcon: some View {
        Image(systemName: "magnifyingglass")
            .font(.system(size: 35))
            .foregroundColor(.white)
            .frame(width: translucentTileSize, height: translucentTileSize)
            .animation(.none, value: searchVm.isSearching)
    }
    
    private var searchField: some View {
        HStack {
            Spacer()
            TextField("Numer lini...", text: $searchVm.searchText)
                .padding()
            Divider()
        }
        .frame(maxWidth: .infinity)
        .frame(height: translucentTileSize)
    }
}
