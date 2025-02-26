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
    
    func fetchMainRoutes(line: String) async throws {
        var isDataLoaded: Bool = false
        var triesCount: Int = 0
        while !isDataLoaded {
            triesCount += 1
            if triesCount > 10 {
                print("Error while fetching given line main routes.")
                throw MyError.tooManyAttemptsWhileFetchingMainRoutes
            }
            print("Attempt: \(triesCount)")
            do {
                let routes = try await LinesScheduleManager().provideAllRoutsForLine(line: line)
                await MainActor.run {
                    if !routes.isEmpty {
                        lineRoutes = routes.sorted(by: {$0.stopsNum > $1.stopsNum})
                        selectedRoute = lineRoutes.first!
                        areRoutesLoaded = true
                    }
                }
                if !lineRoutes.isEmpty {
                    isDataLoaded = true
                }
            } catch {
                print("Attempt \(triesCount) failed with error: \(error)")
                // Still trying to provide main routes.
            }
            try await Task.sleep(nanoseconds: 1_250_000_000)
        }
    }
}
