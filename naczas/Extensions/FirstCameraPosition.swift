//
//  FirstCameraPosition.swift
//  naczas
//
//  Created by Stanisław Makijenko on 24/04/2025.
//

import MapKit
import SwiftUI

extension MapCameraPosition{
    static let firstCamPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.229, longitude: 21.011),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
}
