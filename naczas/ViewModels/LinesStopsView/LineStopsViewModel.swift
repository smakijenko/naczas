//
//  LineStopsViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import Foundation

class LineStopsViewModel: ObservableObject {
    @Published var lineRoutes: [LineRouteModel] = []
    @Published var selectedRoute: LineRouteModel = defaultRoute
    @Published var areRoutesLoaded: Bool = false
    
    func fetchRoutes(line: String) {
        Task {
            var isDataLoaded: Bool = false
            var triesCount: Int = 0
            while !isDataLoaded {
                do {
                    triesCount += 1
                    if triesCount > 10 {
                        print("Error while fetching given line routes.")
                        break
                    }
                    print("Attempt: \(triesCount)")
                    let routes = try await LinesScheduleManager().provideAllRoutsForLine(line: line)
                    await MainActor.run {
                        if !routes.isEmpty {
                            lineRoutes = routes
                            selectedRoute = routes.first!
                            areRoutesLoaded = true
                        }
                    }
                    if !lineRoutes.isEmpty {
                        isDataLoaded = true
                    }
                }
                catch {
                    print("Error: \(error)")
                }
                try await Task.sleep(nanoseconds: 1_250_000_000)
            }
        }
    }
}
