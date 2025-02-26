//
//  LineStopsView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import SwiftUI

struct LineStopsView: View {
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
                    try await stopsVm.fetchMainRoutes(line: line)
                    print("Zaczynam dekodować przystanki")
                    print(try await StopsManager().provideStopsForRoute(route: stopsVm.selectedRoute))
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
    LineStopsView(line: .constant("9"))
}
