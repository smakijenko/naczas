//
//  LinesGridViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 17/02/2025.
//

import Foundation
import SwiftUI

class LinesGridViewModel: ObservableObject {
    @Published var lines: [String] = allBusLines
    @Published var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)
    @Published var searchedText: String = ""
    @Published var availableBusLines: Set<String> = []
    @Published var availableTramsLines: Set<String> = []
    @Published var isSheetShown: Bool = false
    var isOnlineDataLoaded: Bool = false
    var selectedLine = ""

    func resetLinesContainer(transportType: AvailableTransportTypes) {
        lines.removeAll()
        switch transportType {
        case .Autobusy:
            lines = allBusLines
        case .Tramwaje:
            lines = allTramsLines
        }
    }
    
    func giveSearchedLines() -> [String] {
        guard !searchedText.isEmpty else { return lines}
        var searchedLines:[String] = []
        for line in lines {
            if line.contains(searchedText) {
                searchedLines.append(line)
            }
        }
        return searchedLines
    }
    
    func checkIfLineAvailable(line: String, transportType: AvailableTransportTypes) -> Color {
        var blurColor: Color = .clear
        if availableBusLines.isEmpty && availableTramsLines.isEmpty {
            return blurColor
        }
        switch transportType {
        case .Autobusy:
            if availableBusLines.contains(line) { blurColor = .green }
            else { blurColor = .red }
        case .Tramwaje:
            if availableTramsLines.contains(line) { blurColor = .green }
            else { blurColor = .red }
        }
        return blurColor
    }
}
