//
//  AvailableLinesModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 18/02/2025.
//


struct AvailableLineInfoModel: Codable {
    let Lines: String
    let Lon: Double
    let VehicleNumber: String
    let Time: String
    let Lat: Double
    let Brigade: String
}

struct AvailableLinesApiResponse: Codable {
    let result: [AvailableLineInfoModel]
}
