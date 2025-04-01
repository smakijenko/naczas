//
//  StopsModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 25/02/2025.
//

import SwiftData
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

struct StopInfoKeyModel: Codable, Hashable {
    let zespol: String
    let idUlicy: String
    let slupek: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(zespol + idUlicy + slupek)
    }
}

struct StopInfoValueModel: Codable, Hashable {
    let nazwaZespolu: String
    let szerGeo: String
    let dlugGeo: String
    let kierunek: String
    let obowiazujeOd: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(szerGeo + dlugGeo)
    }
}

struct DecodedStopInfoModel: Codable, Hashable {
    let ulicaId: String
    let nrZespołu: String
    let nrPrzystanku: String
    let typ: String
    let szerGeo: String
    let dluGeo: String
    let nazwaZespołu: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(szerGeo + dluGeo)
    }
}

@Model
class StopEntity {
    var stopKeys: StopInfoKeyModel
    var stopValues: StopInfoValueModel
    
    init(stopKeys: StopInfoKeyModel, stopValues: StopInfoValueModel) {
        self.stopKeys = stopKeys
        self.stopValues = stopValues
    }
}
