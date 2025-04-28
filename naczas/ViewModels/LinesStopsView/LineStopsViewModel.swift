//
//  LineStopsViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import Foundation
import SwiftUI

final class LineStopsViewModel: ObservableObject {
    @Published var areRoutesLoaded: Bool = false
    @Published var lineRoutes: [RouteForLineModel] = []
    @Published var preferredRoutes: [PreferredRouteModel] = []
    @Published var selectedPref: PreferredRouteModel = PreferredRouteModel(routeName: "Default", direction: "Default")
    @Published var selectedRoute: RouteForLineModel = defaultRoute
    @Published var showNoRouteAlert: Bool = false
    @Published var showStopDepartures: Bool = false
    @Published var showMap: Bool = false
    @Published var isTabBarShown: Bool = false
    @Published var tabOffset: CGFloat = 200
    let noRouteAlertMessage: String = "Przepraszamy, ale w tym momencie nie możemy wyświetlić rozkładu tej lini. Spróbuj ponownie lub zrestartuj aplikacje."

    func providePreferredRoutesForLine(line: String) throws {
        preferredRoutes = preferredMainRoutes[line] ?? []
        guard let firstRoute = preferredRoutes.first else { throw MyError.unableToLoadPreferredRoutes }
        selectedPref = firstRoute
    }
    
    func provideRoutes(entities: [LineRoutsEntity], line: String) throws {
        guard let lineEntites = entities.first(where: { $0.lineName == line }),
              lineEntites.routes.count >= 2 else { throw MyError.unableToProvideMainRoutes }
        for route in lineEntites.routes {
            for preferred in preferredRoutes {
                if preferred.routeName == route.routeName {
                    lineRoutes.append(route)
                }
            }
        }
        updateSelectedRoute()
        areRoutesLoaded = true
    }
    
    func updateSelectedRoute() {
        guard let route = lineRoutes.first(where: {$0.routeName == selectedPref.routeName}) else { return }
        selectedRoute = route
    }
    
    func showTabBar() {
        withAnimation(.linear(duration: 0.2)) {
            tabOffset = -25
            isTabBarShown = true
        }
    }
    
    func hideTabBar() {
        withAnimation(.linear(duration: 0.2)) {
            tabOffset = 200
            isTabBarShown = false
            touchVibrates.impactOccurred()
        }
    }
}
