//
//  StopsManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 25/02/2025.
//

import Foundation

class StopsManager {
    func fetchAllStops() async throws -> [StopValuesModel]{
        print("Started fetching all stops from API.")
        let apiKey = try getApiKey()
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/dbstore_get/?id=ab75c33d-3a26-4342-b36a-6e5fef0a3ac3&apikey=\(apiKey)") else {
            print("fetchAllStops: \(MyError.wrongURL.localizedDescription)")
            throw MyError.wrongURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedAllStops = try JSONDecoder().decode(AllStopsApiResponse.self, from: data)
        if decodedAllStops.result.isEmpty {
            print("fetchAllStops: \(MyError.APIResponseEmpty.localizedDescription)")
            throw MyError.APIResponseEmpty
        }
        return decodedAllStops.result
    }
        
    func provideAllStopsInDict() async throws -> [StopInfoKeyModel: StopInfoValueModel] {
        print("Started fetching all stops into dictionary.")
        var allStopsDict: [StopInfoKeyModel : StopInfoValueModel] = [:]
        for attempt in 1 ... 10 {
            print("Attempt: \(attempt)")
            do {
                let decodedResult = try await fetchAllStops()
                for stop in decodedResult {
                    var stopDict: [String : String] = [:]
                    for value in stop.values {
                        stopDict[value.key] = value.value
                    }
                    allStopsDict[StopInfoKeyModel (
                        zespol: stopDict["zespol"] ?? "",
                        idUlicy: stopDict["id_ulicy"] ?? "",
                        slupek: stopDict["slupek"] ?? ""
                    )] = StopInfoValueModel(
                        nazwaZespolu: stopDict["nazwa_zespolu"] ?? "",
                        szerGeo: stopDict["szer_geo"] ?? "",
                        dlugGeo: stopDict["dlug_geo"] ?? "",
                        kierunek: stopDict["kierunek"] ?? "",
                        obowiazujeOd: stopDict["obowiazuje_od"] ?? ""
                    )
                }
                if !allStopsDict.isEmpty {
                    return allStopsDict
                }
            }
            catch {
                print("Attempt \(attempt) failed with error: \(error)")
            }
            try await Task.sleep(nanoseconds: 1_500_000_000)
        }
        print("provideAllStopsInDict: \(MyError.tooManyAttemptsWhileFetchingAllStops.localizedDescription)")
        throw MyError.tooManyAttemptsWhileFetchingAllStops
    }
}
