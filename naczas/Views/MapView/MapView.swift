//
//  MapView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

struct MapView: View {
    @EnvironmentObject var mainVm: MainViewModel
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Text("Map View")
        }
    }
}

#Preview {
    MapView()
        .environmentObject(MainViewModel())
}
