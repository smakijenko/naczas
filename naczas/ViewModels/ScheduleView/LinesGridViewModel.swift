//
//  LinesGridViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 17/02/2025.
//

import Foundation
import SwiftUI

class LinesGridViewModel: ObservableObject {
    @Published var lines: [Int] = []
    @Published var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 5)
    @Published var searchedText: String = ""
    
    init() {
        for x in 1...189 {
            lines.append(x)
        }
    }
    
    func giveSearchedLines() -> [Int] {
        guard !searchedText.isEmpty else { return lines}
        var searchedLines:[Int] = []
        for line in lines {
            if String(line).contains(searchedText) {
                searchedLines.append(line)
            }
        }
        return searchedLines
    }
}
