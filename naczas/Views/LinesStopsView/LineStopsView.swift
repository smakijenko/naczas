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
            stopsVm.fetchRoutes(line: line)
        }
    }
}

#Preview {
    LineStopsView(line: .constant("189"))
}
