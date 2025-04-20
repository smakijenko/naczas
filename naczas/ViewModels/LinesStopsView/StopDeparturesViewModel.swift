//
//  StopDeparturesViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 10/04/2025.
//

import Foundation
import SwiftUI

class StopDeparturesViewModel: ObservableObject {
    @Published var linesAndDepartures: [String: [LineDeparturesForStopModel]] = [:]
    @Published var showOnlyMainLineAvailableAlert: Bool = false
    @Published var showNoDeparturesForLineAlert: Bool = false
    @Published var selectedLines: [String] = []
    @Published var departuresArray: [LineDeparturesForStopModel] = []
    private var mainDepartures: [LineDeparturesForStopModel] = []
    private var mainLine: String = ""
    
    func setMainLineMainDepartures(mainLine: String, mainDepartures: [LineDeparturesForStopModel]) {
        self.mainDepartures = mainDepartures
        self.mainLine = mainLine
        selectedLines.append(mainLine)
        linesAndDepartures[mainLine] = mainDepartures
        departuresArray = mainDepartures
    }
    
    func provideLinesFromStop(stopGroupName: String, stopNr: String) async {
        showOnlyMainLineAvailableAlert = false
        do {
            let resultlinesFromStop: [String] = try await LinesFromStopManager().provideLinesFromStop(stopGroupName: stopGroupName, stopNr: stopNr)
            for line in resultlinesFromStop {
                linesAndDepartures[line] = []
            }
        }
        catch {
            print("StopDeparturesViewModel.provideLinesFromStop: \(MyError.tooManyAttemptsWhileProvidingLinesFromStop.localizedDescription)")
            showOnlyMainLineAvailableAlert = true
        }
    }
    
    func provideSortedKeyes() -> [String] {
        var linesArr = linesAndDepartures.keys.sorted()
        linesArr.removeAll { $0 == mainLine }
        linesArr.insert(mainLine, at: 0)
        return linesArr
    }
    
    func checkForLineDepartures(stopGroupName: String, stopNr: String, lineNr: String) async {
        guard let departuresForLine = linesAndDepartures[lineNr], departuresForLine.isEmpty, lineNr != mainLine else { return }
        do {
            let departures = try await LineDeparturesForStopManager().fetchAllAvailableLines(stopGroupName: stopGroupName, stopNr: stopNr, lineNr: lineNr)
            await MainActor.run {
                linesAndDepartures[lineNr] = departures
            }
        }
        catch {
            print("updateDeparturesArray: \(MyError.APIResponseEmpty.localizedDescription)")
            showNoDeparturesForLineAlert = true
        }
    }
    
    func updateDeparturesArray(lineNr: String) {
        var depArr: [LineDeparturesForStopModel] = []
        departuresArray = []
        if selectedLines.contains(lineNr) && mainLine != lineNr {
            selectedLines.removeAll(where: { $0 == lineNr })
        }
        else if mainLine != lineNr {
            selectedLines.append(lineNr)
        }
        for line in selectedLines {
            if line == mainLine { depArr.append(contentsOf: mainDepartures) }
            guard linesAndDepartures[line] != nil else { continue }
            depArr.append(contentsOf: linesAndDepartures[line]!)
        }
        departuresArray = depArr.sorted { $0.czas < $1.czas }
    }
    
    func findClosestDeparture() -> String? {
        for departure in departuresArray {
            if let howMuch = howMuchToNext(depTime: departure.czas) {
                if howMuch >= 0 {
                    return departure.czas
                }
            }
        }
        return nil
    }
    
    func convertToNextTime(depTime: String) -> String {
        let minutes = howMuchToNext(depTime: depTime)
        guard let minutes = minutes else { return "?" }
        if minutes < 0 { return "Odjechał" }
        else if minutes == 0 { return "Teraz" }
        else if minutes <= 60 { return "\(minutes)min"}
        else { return ">60min" }
    }
}
