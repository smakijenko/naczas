//
//  StopsModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 25/02/2025.
//

import Foundation

struct AllStopsApiResponse: Codable {
    let result: [StopValuesModel]
}

struct StopValuesModel: Codable {
    let values: [StopValueKeyModel]
}

struct StopValueKeyModel: Codable {
    let key: String
    let value: String
}

struct StopInfoModel: Codable {
    let zespol: String
    let slupek: String
    let nazwaZespolu: String
    let idUlicy: String
    let szerGeo: String
    let dlugGeo: String
    let kierunek: String
    let obowiazujeOd: String
}
