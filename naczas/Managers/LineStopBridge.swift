//
//  LineStopBridge.swift
//  naczas
//
//  Created by Stanisław Makijenko on 08/04/2025.
//

import Foundation

class LineStopBridge: ObservableObject {
    @Published var wasLineStopsSelected: Bool = false
    @Published var showLineStopsView: (Bool, String) = (false, "")
}
