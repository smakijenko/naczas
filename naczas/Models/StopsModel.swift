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

@Model
class StopEntity {
    var stopKeys: StopInfoKeyModel
    var stopValues: StopInfoValueModel

    init(stopKeys: StopInfoKeyModel, stopValues: StopInfoValueModel) {
        self.stopKeys = stopKeys
        self.stopValues = stopValues
    }
}

//}
//  "result": [
//    {
//      "values": [
//        {
//          "value": "1001",
//          "key": "zespol"
//        },
//        {
//          "value": "01",
//          "key": "slupek"
//        },
//        {
//          "value": "Kijowska",
//          "key": "nazwa_zespolu"
//        },
//        {
//          "value": "2201",
//          "key": "id_ulicy"
//        },
//        {
//          "value": "52.248455",
//          "key": "szer_geo"
//        },
//        {
//          "value": "21.044827",
//          "key": "dlug_geo"
//        },
//        {
//          "value": "al.Zieleniecka",
//          "key": "kierunek"
//        },
//        {
//          "value": "2024-12-14 00:00:00.0",
//          "key": "obowiazuje_od"
//        }
//      ]
//    }
//}
