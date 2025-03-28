//
//  LinesGridView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 17/02/2025.
//

import SwiftUI

struct LinesGridView: View {
    @EnvironmentObject var manager: GlobalDataManager
    @StateObject var gridVm = LinesGridViewModel()
    @Binding var searchedText: String
    @Binding var transportType: AvailableTransportTypes
    @Binding var isOnlineTransportLoaded: Bool
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
        .onChange(of: gridVm.isOnlineDataLoaded) {
            isOnlineTransportLoaded = true
        }
        .onAppear {
            Task {
                do {
                    try await gridVm.loadAvailableLines()
                }
                catch {
                    print("Alert: Could not fetch all available lines.")
                    // Handle alert saying that it was not possible to fetch all available lines.
                }
            }
        }
    }
}

#Preview {
    LinesGridView(searchedText: .constant(""), transportType: .constant(.Autobusy), isOnlineTransportLoaded: .constant(false))
        .environmentObject(GlobalDataManager())
}

extension LinesGridView {
    private func createLineTile(line: String, transportType: AvailableTransportTypes) -> some View {
        return ZStack {
            Button {
                guard manager.isDatasAvailable else { return }
                gridVm.isSheetShown.toggle()
                gridVm.selectedLine = line
            } label: {
                Text(line)
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 40)
                    .background(customTranslucentMaterial)
                    .cornerRadius(10)
                    .shadow(color: gridVm.checkIfLineAvailable(line: line, transportType: transportType), radius: 5)
            }
        }
        .sheet(isPresented: $gridVm.isSheetShown) {
            LineStopsView(line: $gridVm.selectedLine)
        }
    }
}
