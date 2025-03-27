//
//  CustomRoutesManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 27/03/2025.
//

import Foundation

class CustomRoutesManager {
    func fetchRoutesFromJson() throws -> [String: [LineCustomRouteModel]] {
        guard let url = Bundle.main.url(forResource: "customRoutes", withExtension: "json") else {
            print(MyError.unableToFindJSONFile.localizedDescription)
            throw MyError.unableToFindJSONFile
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedRoutes = try JSONDecoder().decode([String: [LineCustomRouteModel]].self, from: data)
            return decodedRoutes
        }
        catch {
            print(MyError.unableToFetchCustomRoutes.localizedDescription)
            throw MyError.unableToFetchCustomRoutes
        }
    }
    
    func convertCustomToNormal(stops: [CustomRouteStopInfoModel]) -> [RouteStopInfoModel] {
        var returnArray: [RouteStopInfoModel] = []
        for stop in stops {
            returnArray.append(RouteStopInfoModel (
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
