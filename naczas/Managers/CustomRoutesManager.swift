//
//  CustomRoutesManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 27/03/2025.
//

import Foundation

class CustomRoutesManager {
    func fetchRoutesFromJson() throws -> [String: [LineRouteModel]]{
        guard let url = Bundle.main.url(forResource: "mainRoutes", withExtension: "json") else { throw MyError.unableToFindJSONFile }
        do {
            let data = try Data(contentsOf: url)
            let decodedRoutes = try JSONDecoder().decode([String: [LineRouteModel]].self, from: data)
            return decodedRoutes
        }
        catch {
            throw MyError.unableToFetchCustomRoutes
        }
    }
}
