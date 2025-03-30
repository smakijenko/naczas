//
//  GetApiKey.swift
//  naczas
//
//  Created by Stanisław Makijenko on 30/03/2025.
//

import Foundation

func getApiKey() throws -> String {
    guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
          let dict = NSDictionary(contentsOfFile: path),
          let apiKey = dict["API_KEY"] as? String, !apiKey.isEmpty else {
        throw MyError.wrongKey
    }
    return apiKey
}
