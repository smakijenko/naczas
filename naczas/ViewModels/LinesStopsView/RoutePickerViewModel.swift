//
//  RoutePickerViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 22/02/2025.
//

import Foundation
import SwiftUI

class RoutePickerViewModel: ObservableObject {
    @Published var isRoutesListShown: Bool = false
    
    func showRoutesList() {
        withAnimation(.easeInOut(duration: 0.2)) {
            isRoutesListShown.toggle()
        }
    }
}
