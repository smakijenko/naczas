//
//  LineDeparturesForStopManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 03/04/2025.
//

import Foundation

class LineDeparturesForStopManager {
    func fetchAllAvailableLines(stopGroupName: String, stopNr: String, lineNr: String) async throws -> [LineDeparturesForStopModel] {
        print("Started fetching schedules for stop and line from API response.")
        var lineDeparturesForStop: [LineDeparturesForStopModel] = []
        let apiKey = try getApiKey()
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/dbtimetable_get/?id=e923fa0e-d96c-43f9-ae6e-60518c9f3238&busstopId=\(stopGroupName)&busstopNr=\(stopNr)&line=\(lineNr)&apikey=\(apiKey)") else {
            print(("fetchAllAvailableLines: \(MyError.wrongURL.localizedDescription)"))
            throw MyError.wrongURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedLineDeparturesForStop = try JSONDecoder().decode(LineDeparturesForStopAPIResponse.self, from: data)
        var departureDict: [String : String] = [:]
        for keyValue in decodedLineDeparturesForStop.result {
            for item in keyValue {
                departureDict[item.key] = item.value
            }
            lineDeparturesForStop.append(LineDeparturesForStopModel (
                brygada: departureDict["brygada"] ?? "",
                kierunek: departureDict["kierunek"] ?? "",
                trasa: departureDict["trasa"] ?? "",
                czas: departureDict["czas"] ?? "",
                line: lineNr
            ))
        }
        if lineDeparturesForStop.isEmpty {
            print("fetchAllAvailableLines: \(MyError.APIResponseEmpty.localizedDescription)")
            throw MyError.APIResponseEmpty
        }
        return lineDeparturesForStop
    }
}
