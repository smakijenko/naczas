//
//  LineStopsViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import Foundation

@MainActor
final class LineStopsViewModel: ObservableObject {
    @Published var areRoutesLoaded: Bool = false
    @Published var lineRoutes: [LineRouteModel] = []
    @Published var preferredRoutes: [PreferredRouteModel] = []
    @Published var selectedRoute: PreferredRouteModel = PreferredRouteModel(routeName: "Default", direction: "Default")
    
    func providePreferredRoutesForLine(line: String) {
        preferredRoutes = preferredMainRoutes[line] ?? []
        guard let firstRoute = preferredRoutes.first else { return }
        selectedRoute = firstRoute
    }
    
    func provideRoutes(entities: [LineRoutsEntity], line: String) throws {
        guard let lineEntites = entities.first(where: { $0.lineName == line }),
              !lineEntites.routes.isEmpty else { throw MyError.unableToProvideMainRoutes }
        for route in lineEntites.routes {
            for preferred in preferredRoutes {
                if preferred.routeName == route.routeName {
                    lineRoutes.append(route)
                }
            }
        }
        areRoutesLoaded = true
    }
}
