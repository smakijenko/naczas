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
        print("Started fetching all available lines.")
        let apiKey = try getApiKey()
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/busestrams_get/?resource_id=%20f2e5503e927d-4ad3-9500-4ab9e55deb59&apikey=\(apiKey)&type=\(type)") else { throw MyError.wrongURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedAvailableLines = try JSONDecoder().decode(AvailableLinesApiResponse.self, from: data)
        return decodedAvailableLines.result
    }
    
    func provideOnlineUniqueLines(transportType: AvailableTransportTypes) async throws -> [String] {
        var uniqueLines: Set<String> = []
        print("Started providing unique lines.")
        let allAvailableLines = try await fetchAllAvailableLines(type: transportType == .Autobusy ? "1" : "2")
        for line in allAvailableLines {
            guard let timeBetween = differenceBetweenDate(lastUpdateString: line.time) else { continue }
            if timeBetween < 5 {
                uniqueLines.insert(line.lines)
            }
        }
        return Array(uniqueLines)
    }
}
