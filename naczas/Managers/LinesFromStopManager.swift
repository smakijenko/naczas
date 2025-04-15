//
//  LinesFromStopManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 09/04/2025.
//

import Foundation

class LinesFromStopManager {
    func fetchLinesFromStop(stopGroupName: String, stopNr: String) async throws -> [String] {
        print("Started fetching all lines from stop from API response.")
        var results: [String] = []
        let apiKey = try getApiKey()
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/dbtimetable_get/?id=88cd555f-6f31-43ca-9de4-66c479ad5942&busstopId=\(stopGroupName)&busstopNr=\(stopNr)&apikey=\(apiKey)") else {
            print(("fetchLinesFromStop: \(MyError.wrongURL.localizedDescription)"))
            throw MyError.wrongURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedLinesFromStop = try JSONDecoder().decode(LinesFromStopApiResponse.self, from: data)
        if decodedLinesFromStop.result.isEmpty {
            print("fetchLinesFromStop: \(MyError.APIResponseEmpty.localizedDescription)")
            throw MyError.APIResponseEmpty
        }
        for result in decodedLinesFromStop.result {
            for line in result.values {
                results.append(line.value)
            }
        }
        return results
    }
    
    func provideLinesFromStop(stopGroupName: String, stopNr: String) async throws -> [String] {
        print("Started providing lines from stop.")
        for attempt in 1 ... 10 {
            print("Attempt \(attempt)")
            do {
                return try await fetchLinesFromStop(stopGroupName: stopGroupName, stopNr: stopNr)
            }
            catch {
                print("Attempt \(attempt) failed with error: \(error)")
            }
            try await Task.sleep(nanoseconds: 1_500_000_000)
        }
        print("provideLinesFromStop: \(MyError.tooManyAttemptsWhileProvidingLinesFromStop.localizedDescription)")
        throw MyError.tooManyAttemptsWhileProvidingLinesFromStop
    }
}
