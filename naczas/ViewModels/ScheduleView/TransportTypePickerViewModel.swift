//
//  TransportTypePickerViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 17/02/2025.
//

import Foundation
import SwiftUI

class TransportTypePickerViewModel: ObservableObject {
    @Published var selectedType: AvailableTransportTypes = .Autobusy
    
    func changeSelectedType(type: AvailableTransportTypes) {
        withAnimation(.easeInOut(duration: 0.2)) {
            selectedType = type
        }
    }
}
