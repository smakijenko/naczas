//
//  LinesFromStopModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 09/04/2025.
//

import Foundation

struct LinesFromStopApiResponse: Codable {
    let result: [LinesFromStopResultItem]
}

struct LinesFromStopResultItem: Codable {
    let values: [LinesFromStopModel]
}

struct LinesFromStopModel: Codable {
    let key: String
    let value: String
}

