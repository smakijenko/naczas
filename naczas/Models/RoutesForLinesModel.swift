//
//  RoutesForLinesModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import SwiftData

struct RoutesForLinesApiResponse: Codable {
    let result: [String: [String: [String: StopInRouteInfoModel]]]
}

struct StopInRouteInfoModel: Codable {
    let odleglosc: Int
    let ulicaID: String
    let nrZespolu: String
    let typ: String
    let nrPrzystanku: String
    
    enum CodingKeys: String, CodingKey {
        case odleglosc
        case ulicaID = "ulica_id"
        case nrZespolu = "nr_zespolu"
        case typ
        case nrPrzystanku = "nr_przystanku"
    }
}

struct RouteForLineModel: Codable {
    let routeName: String
    let stops: [StopInRouteInfoModel]
    let stopsNum: Int
}

struct CustomStopInRouteInfoModel: Codable {
    let odleglosc: Int
    let ulicaID: String
    let nrZespolu: String
    let typ: String
    let nrPrzystanku: String
}

struct CustomRouteForLineModel: Codable {
    let routeName: String
    let stops: [CustomStopInRouteInfoModel]
    let stopsNum: Int
}

struct AllRoutesForLineModel: Codable {
    let lineName: String
    let routes: [RouteForLineModel]
}

@Model
class LineRoutsEntity {
    var lineName: String
    var routes: [RouteForLineModel]

    init(lineName: String, routes: [RouteForLineModel]) {
        self.lineName = lineName
        self.routes = routes
    }
}
