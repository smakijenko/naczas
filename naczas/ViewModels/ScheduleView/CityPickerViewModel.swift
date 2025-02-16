//
//  CityPickerViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 16/02/2025.
//

import Foundation
import SwiftUI

class CityPickerViewModel: ObservableObject {
    @Published var selectedCity: AvailableCities = .Warszawa
    @Published var showCitiesList: Bool = false
    @Published var unselectedCities: [AvailableCities] = []
    enum AvailableCities: String, CaseIterable{
        case Warszawa, Kraków, Gdańsk, Łódź
        var name: String { rawValue }
    }
    let selectedCitySize: CGFloat = 70
    let maximumCitiesScrollWidth: CGFloat = 190
    
    init() {
        updateUnselectedCities()
    }
    
    func toogleCityList() {
        withAnimation(.easeInOut(duration: 0.2)) {
            showCitiesList.toggle()
        }
    }
    
    func updateUnselectedCities() {
        unselectedCities.removeAll()
        for city in AvailableCities.allCases {
            unselectedCities.append(city)
        }
        unselectedCities.removeAll { $0 == selectedCity }
    }
}
