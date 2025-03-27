//
//  LinesScheduleModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import SwiftData

struct LinesScheduleApiResponse: Codable {
    let result: [String: [String: [String: RouteStopInfoModel]]]
}

struct RouteStopInfoModel: Codable {
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

struct LineRouteModel: Codable {
    let routeName: String
    let stops: [RouteStopInfoModel]
    let stopsNum: Int
}

struct CustomRouteStopInfoModel: Codable {
    let odleglosc: Int
    let ulicaID: String
    let nrZespolu: String
    let typ: String
    let nrPrzystanku: String
}

struct LineCustomRouteModel: Codable {
    let routeName: String
    let stops: [CustomRouteStopInfoModel]
    let stopsNum: Int
}

struct LineRoutesModel: Codable {
    let lineName: String
    let routes: [LineRouteModel]
}

@Model
class LineRoutsEntity {
    var lineName: String
    var routes: [LineRouteModel]

    init(lineName: String, routes: [LineRouteModel]) {
        self.lineName = lineName
        self.routes = routes
    }
}
