//
//  RoutesForLinesManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import Foundation

class RoutesForLinesManager {
    func fetchAllRoutesForAllLines() async throws -> [String: [String: [String: StopInRouteInfoModel]]] {
        print("Started fetching all routes for all lines from API")
        let apiKey = try getApiKey()
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/public_transport_routes/?apikey=\(apiKey)") else {
            print("fetchAllRoutesForAllLines: \(MyError.wrongURL.localizedDescription)")
            throw MyError.wrongURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedSchedules = try JSONDecoder().decode(RoutesForLinesApiResponse.self, from: data)
        if decodedSchedules.result.isEmpty {
            print("fetchAllRoutesForAllLines: \(MyError.APIResponseEmpty)")
            throw MyError.APIResponseEmpty
        }
        return decodedSchedules.result
    }
        
    func provideAllRoutsForLines() async throws -> [AllRoutesForLineModel] {
        print("Started providng all routes for all lines in array of AllRoutesForLineModel.")
        var routesForAllLines: [AllRoutesForLineModel] = []
        for attempt in 1 ... 10  {
            print("Attempt: \(attempt)")
            do {
                let schedules = try await fetchAllRoutesForAllLines()
                for (line, routes) in schedules {
                    var lineRoutes: [RouteForLineModel] = []
                    for (routeName, stops) in routes {
                        var routeStops: [StopInRouteInfoModel] = []
                        for (_, stopInfo) in stops {
                            routeStops.append(StopInRouteInfoModel(
                                odleglosc: stopInfo.odleglosc,
                                ulicaID: stopInfo.ulicaID,
                                nrZespolu: stopInfo.nrZespolu,
                                typ: stopInfo.typ,
                                nrPrzystanku: stopInfo.nrPrzystanku
                            ))
                        }
                        let sortedRouteStops = routeStops.sorted(by: {$0.odleglosc < $1.odleglosc})
                        lineRoutes.append(RouteForLineModel (
                            routeName: routeName,
                            stops: sortedRouteStops,
                            stopsNum: routeStops.count
                        ))
                    }
                    routesForAllLines.append(AllRoutesForLineModel(lineName: line, routes: lineRoutes))
                }
                if !routesForAllLines.isEmpty {
                    return routesForAllLines
                }
            } catch {
                print("Attempt \(attempt) failed with error: \(error)")
            }
            try await Task.sleep(nanoseconds: 1_500_000_000)
        }
        print("provideAllRoutsForLines: \(MyError.tooManyAttemptsWhileFetchingAllRoutesForAllLines.localizedDescription)")
        throw MyError.tooManyAttemptsWhileFetchingAllRoutesForAllLines
    }
}
