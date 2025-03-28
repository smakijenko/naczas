//
//  LineStopsView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import SwiftUI

struct LineStopsView: View {
    @EnvironmentObject var manager: GlobalDataManager
    @StateObject var stopsVm = LineStopsViewModel()
    @Binding var line: String
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                DirectionPickerView(selectedRoute: $stopsVm.selectedRoute, routes: stopsVm.preferredRoutes, isDataLoaded: stopsVm.areRoutesLoaded)
                Spacer()
            }
        }
        .environmentObject(stopsVm)
        .onAppear {
            stopsVm.providePreferredRoutesForLine(line: line)
            Task {
                do {
                    await manager.updateLineRoutesAndStops() // -> for preview
                    stopsVm.providePreferredRoutesForLine(line: line)
                    try stopsVm.provideRoutes(entities: manager.linesRoutes, line: line)
                }
                catch {
                    print("Alert: Could not fetch main routes.")
                    // Handle alert saying that it was not possible to fetch main routes.
                }
            }
        }
    }
}

#Preview {
    LineStopsView(line: .constant("157"))
        .environmentObject(GlobalDataManager())
}
