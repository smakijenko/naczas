//
//  LinesScheduleModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

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
