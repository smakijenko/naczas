//
//  StopDeparturesViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 10/04/2025.
//

import Foundation

class StopDeparturesViewModel: ObservableObject {
    @Published var linesFromStop: [String] = []
    @Published var showOnlyMainLineAvailableAlert: Bool = false
    @Published var selectedLines: [String] = []
    
    func provideLinesFromStop(stopGroupName: String, stopNr: String, mainLine: String) async {
        showOnlyMainLineAvailableAlert = false
        linesFromStop.append(mainLine)
        selectedLines.append(mainLine)
        do {
            var resultlinesFromStop: [String] = try await LinesFromStopManager().provideLinesFromStop(stopGroupName: stopGroupName, stopNr: stopNr)
            resultlinesFromStop.removeAll { $0 == mainLine }
            linesFromStop.append(contentsOf: resultlinesFromStop.sorted { $0.localizedStandardCompare($1) == .orderedAscending })
        }
        catch {
            print("StopDeparturesViewModel.provideLinesFromStop: \(MyError.tooManyAttemptsWhileProvidingLinesFromStop.localizedDescription)")
            showOnlyMainLineAvailableAlert = true
        }
    }
}
