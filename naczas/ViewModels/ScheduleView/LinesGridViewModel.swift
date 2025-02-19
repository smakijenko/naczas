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
    
    func resetLinesContainer(transportType: AvailableTransportTypes) {
        lines.removeAll()
        if transportType == .Autobusy {
            lines = allBusLines
        }
        else {
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
}
