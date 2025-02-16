//
//  MapView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var mainVm: MainViewModel
    let mapView = MKMapView()
    var body: some View {
        ZStack {
            Map()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MapView()
        .environmentObject(MainViewModel())
}
