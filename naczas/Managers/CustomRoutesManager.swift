//
//  CustomRoutesManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 27/03/2025.
//

import Foundation

class CustomRoutesManager {
    func fetchRoutesFromJson() throws -> [String: [CustomRouteForLineModel]] {
        guard let url = Bundle.main.url(forResource: "customRoutes", withExtension: "json") else {
            print("fetchRoutesFromJson: \(MyError.unableToFindJSONFile.localizedDescription)")
            throw MyError.unableToFindJSONFile
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedRoutes = try JSONDecoder().decode([String: [CustomRouteForLineModel]].self, from: data)
            return decodedRoutes
        }
        catch {
            print("fetchRoutesFromJson: \(MyError.unableToFetchCustomRoutes.localizedDescription)")
            throw MyError.unableToFetchCustomRoutes
        }
    }
    
    func convertCustomToNormal(stops: [CustomStopInRouteInfoModel]) -> [StopInRouteInfoModel] {
        var returnArray: [StopInRouteInfoModel] = []
        for stop in stops {
            returnArray.append(StopInRouteInfoModel (
                odleglosc: stop.odleglosc,
                ulicaID: stop.ulicaID,
                nrZespolu: stop.nrZespolu,
                typ: stop.typ,
                nrPrzystanku: stop.nrPrzystanku
            ))
        }
        return returnArray
    }
}
