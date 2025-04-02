//
//  AvailableLinesModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 18/02/2025.
//

struct ActiveBusTramApiResponse: Codable {
    let result: [ActiveBusTramModel]
}

struct ActiveBusTramModel: Codable {
    let lines: String
    let lon: Double
    let vehicleNumber: String
    let time: String
    let lat: Double
    let brigade: String
    
    enum CodingKeys: String, CodingKey {
        case lines = "Lines"
        case lon = "Lon"
        case vehicleNumber = "VehicleNumber"
        case time = "Time"
        case lat = "Lat"
        case brigade = "Brigade"
    }
}
