//
//  StopsManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 25/02/2025.
//

import Foundation

class StopsManager {
    func fetchAllStops() async throws -> [StopInfoKeyModel : StopInfoValueModel]{
        var allStopsDict: [StopInfoKeyModel : StopInfoValueModel] = [:]
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
        return allStopsDict
    }
    
    func provideStopsForRoute(route: LineRouteModel) async throws -> [String] {
        var stops: [String] = []
        do {
            let allStopsDict = try await fetchAllStops()
            for stop in route.stops {
                let key = StopInfoKeyModel (
                    zespol: stop.nrZespolu,
                    idUlicy: stop.ulicaID,
                    slupek: stop.nrPrzystanku
                )
                if let value = allStopsDict[key] {
                    stops.append(value.nazwaZespolu + " " + key.slupek)
                }
                else { stops.append("Nieznany") }
            }
        }
        catch {
            print(error)
        }
        return stops
    }
}
