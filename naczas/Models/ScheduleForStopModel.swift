//
//  ScheduleForStopModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 03/04/2025.
//

struct LineDeparturesForStopAPIResponse: Codable {
    let result: [[KeyValuePairForStopModel]]
}

struct KeyValuePairForStopModel: Codable {
    let key: String
    let value: String?
}

struct LineDeparturesForStopModel: Codable, Hashable {
    let brygada: String
    let kierunek: String
    let trasa: String
    let czas: String
    let line: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(kierunek + trasa + czas)
    }
}
