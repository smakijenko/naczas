//
//  LineStopsViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import Foundation

@MainActor
final class LineStopsViewModel: ObservableObject {
    @Published var lineRoutes: [LineRouteModel] = []
    @Published var selectedRoute: LineRouteModel = defaultRoute
    @Published var areRoutesLoaded: Bool = false
    @Published var linesRoutes: [LineRoutsEntity] = []

    func provideMainRouteForLineFromDB(line: String, entities: [LineRoutsEntity]) {
        guard let givenLineEntity = entities.first(where: {$0.lineName == line}) else { return }
        if !givenLineEntity.routes.isEmpty {
            lineRoutes = givenLineEntity.routes.sorted(by: {$0.stopsNum > $1.stopsNum})
            selectedRoute = lineRoutes.first!
            areRoutesLoaded = true
        }
    }
}
