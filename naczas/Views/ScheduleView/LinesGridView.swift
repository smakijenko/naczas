//
//  LinesGridView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 17/02/2025.
//

import SwiftUI

struct LinesGridView: View {
    @StateObject var gridVm = LinesGridViewModel()
    @Binding var searchedText: String
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: gridVm.columns, alignment: .center) {
                ForEach(gridVm.giveSearchedLines(), id: \.self) { line in
                    Text("\(line)")
                        .frame(width: 50, height: 40)
                        .background(customTranslucentMaterial)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
            }
        }
        .frame(maxWidth: screenSize.width)
        .onChange(of: searchedText) {
            gridVm.searchedText = searchedText
        }
    }
}

#Preview {
    LinesGridView(searchedText: .constant(""))
}
