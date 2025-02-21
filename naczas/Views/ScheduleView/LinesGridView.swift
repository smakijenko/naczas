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
    @Binding var transportType: AvailableTransportTypes
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: gridVm.columns, alignment: .center) {
                ForEach(gridVm.giveSearchedLines(), id: \.self) { line in
                    createLineTile(line: line, transportType: transportType)
                }
            }
        }
        .frame(maxWidth: screenSize.width)
        .onChange(of: transportType) {
            gridVm.resetLinesContainer(transportType: transportType)
        }
        .onChange(of: searchedText) {
            gridVm.searchedText = searchedText
        }
        .sheet(isPresented: $gridVm.isSheetShown) {
            LineStopsView()
        }
    }
}

#Preview {
    LinesGridView(searchedText: .constant(""), transportType: .constant(.Autobusy))
}

extension LinesGridView {
    private func createLineTile(line: String, transportType: AvailableTransportTypes) -> some View {
        return Button {
            gridVm.isSheetShown.toggle()
        } label: {
            Text(line)
                .foregroundStyle(.white)
                .frame(width: 50, height: 40)
                .background(customTranslucentMaterial)
                .cornerRadius(10)
                .shadow(color: gridVm.checkIfLineAvailable(line: line, transportType: transportType), radius: 5)
        }
    }
}
