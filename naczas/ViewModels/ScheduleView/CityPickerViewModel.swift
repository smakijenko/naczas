//
//  CityPickerViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 16/02/2025.
//

import Foundation
import SwiftUI

class CityPickerViewModel: ObservableObject {
    @Published var selectedCity: AvailableCitiesToPick = .Warszawa
    @Published var showCitiesList: Bool = false
    @Published var unselectedCities: [AvailableCitiesToPick] = []
    
    init() {
        updateUnselectedCities()
    }

    func updateUnselectedCities() {
        unselectedCities.removeAll()
        for city in AvailableCitiesToPick.allCases {
            unselectedCities.append(city)
        }
        unselectedCities.removeAll { $0 == selectedCity }
    }
}
