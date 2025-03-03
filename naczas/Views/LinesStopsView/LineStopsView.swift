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
                HStack {
                    RoutePickerView(areRoutesLoaded: $stopsVm.areRoutesLoaded)
                        .padding()
                    Spacer()
                }
                Spacer()
            }
        }
        .environmentObject(stopsVm)
        .onAppear {
            Task {
                do {
                    stopsVm.provideMainRouteForLineFromDB(line: line, entities: manager.linesRoutes)
                    print("Decoding stops for line: \(line)")
                    print(try await StopsManager().decodeRouteStops(route: stopsVm.selectedRoute))
                }
                catch {
                    print("Alert: Could not fetch main routes.")
                    // Handle alert saying that it was not possible to fetch main routes.
                }
            }
        }
        .onChange(of: stopsVm.selectedRoute.routeName) {
            Task {
                print(try await StopsManager().decodeRouteStops(route: stopsVm.selectedRoute))
            }
        }
    }
}

#Preview {
    LineStopsView(line: .constant("189"))
        .environmentObject(GlobalDataManager())
}
