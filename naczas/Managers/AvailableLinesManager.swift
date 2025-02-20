//
//  AvailableLinesManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 18/02/2025.
//

import Foundation

class AvailableLinesManager {
    // Type: 1 - Buses, 2 - Trams
    func fetchAllAvailableLines(type: String) async throws -> [AvailableLineInfoModel] {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return [] }
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/busestrams_get/?resource_id=%20f2e5503e927d-4ad3-9500-4ab9e55deb59&apikey=\(apiKey)&type=\(type)") else { return []}
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedAvailableLines = try JSONDecoder().decode(AvailableLinesApiResponse.self, from: data)
        return decodedAvailableLines.result
    }
    
    func provideOnlineUniqueLines(transportType: AvailableTransportTypes) async throws -> [String] {
        print("start")
        let allAvailableLines = try await fetchAllAvailableLines(type: transportType == .Autobusy ? "1" : "2")
        var uniqueLines: Set<String> = []
        for line in allAvailableLines {
            guard let timeBetween = differenceBetweenDate(lastUpdateString: line.Time) else { continue }
            if timeBetween < 5 {
                uniqueLines.insert(line.Lines)
            }
        }
        return Array(uniqueLines)
    }
}
