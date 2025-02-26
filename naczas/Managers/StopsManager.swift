//
//  StopsManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 25/02/2025.
//

//https://api.um.warszawa.pl/api/action/dbstore_get/?id=ab75c33d-3a26-4342-b36a-6e5fef0a3ac3&apikey=5c08b938-c371-41d6-b27a-e55b6d846b8b

import Foundation

class StopsManager {
    func fetchAllStops() async throws -> [StopInfoModel]{
        var allStops: [StopInfoModel] = []
        print("Started fetching all stops.")
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { throw MyError.wrongKey }
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/dbstore_get/?id=ab75c33d-3a26-4342-b36a-6e5fef0a3ac3&apikey=\(apiKey)") else { throw MyError.wrongURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedAllStops = try JSONDecoder().decode(AllStopsApiResponse.self, from: data)
        for stop in decodedAllStops.result {
            var stopDict: [String : String] = [:]
            for value in stop.values {
                stopDict[value.key] = value.value
            }
            allStops.append(StopInfoModel (
                zespol: stopDict["zespol"] ?? "",
                slupek: stopDict["slupek"] ?? "",
                nazwaZespolu: stopDict["nazwa_zespolu"] ?? "",
                idUlicy: stopDict["id_ulicy"] ?? "",
                szerGeo: stopDict["szer_geo"] ?? "",
                dlugGeo: stopDict["dlug_geo"] ?? "",
                kierunek: stopDict["kierunek"] ?? "",
                obowiazujeOd: stopDict["obowiazuje_od"] ?? ""
            ))
        }
        return allStops
    }
}
