//
//  LinesScheduleManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import Foundation

class LinesScheduleManager {
    func fetchAllSchedules() async throws -> [String: [String: [String: StopInfoModel]]] {
        print("Started fetching all schedules.")
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { throw MyError.wrongKey }
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/public_transport_routes/?apikey=\(apiKey)") else { throw MyError.wrongURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedSchedules = try JSONDecoder().decode(LinesScheduleApiResponse.self, from: data)
        return decodedSchedules.result
    }
    
    func provideAllRoutsForLine(line: String) async throws -> [LineRouteModel] {
        var lineRoutes: [LineRouteModel] = []
        print("Started fetching all routes for line \(line)")
        let schedules = try await fetchAllSchedules()
        guard let route = schedules[line] else { throw MyError.noLine }
        for (routeName, stops) in route {
            var routeStops: [StopInfoModel] = []
            for (_, stopInfo) in stops {
                routeStops.append(StopInfoModel(
                    odleglosc: stopInfo.odleglosc,
                    ulicaID: stopInfo.ulicaID,
                    nrZespolu: stopInfo.nrZespolu,
                    typ: stopInfo.typ,
                    nrPrzystanku: stopInfo.nrPrzystanku
                ))
            }
            let sortedRouteStops = routeStops.sorted(by: {$0.odleglosc < $1.odleglosc})
            lineRoutes.append(LineRouteModel (
                routeName: routeName,
                stops: sortedRouteStops,
                stopsNum: routeStops.count
            ))
        }
        return lineRoutes
    }
}
