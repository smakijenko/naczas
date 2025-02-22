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
    
    init() {
        loadAvailableLines()
    }
    
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
    
    func loadAvailableLines() {
        Task {
            var isDataLoaded: Bool = false
            var triesCount: Int = 0
            while !isDataLoaded {
                do {
                    triesCount += 1
                    if triesCount > 10 { break }
                    print("Attempt: \(triesCount)")
                    let buses = try await AvailableLinesManager().provideOnlineUniqueLines(transportType: .Autobusy)
                    let trams = try await AvailableLinesManager().provideOnlineUniqueLines(transportType: .Tramwaje)
                    await MainActor.run {
                        availableBusLines = Set(buses)
                        availableTramsLines = Set(trams)
                    }
                    if !availableBusLines.isEmpty && !availableTramsLines.isEmpty {
                        isDataLoaded = true
                        isOnlineDataLoaded = true
                    }
                }
                catch {
                    print("Error: \(error)")
                }
                try await Task.sleep(nanoseconds: 1_250_000_000)
            }
        }
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
