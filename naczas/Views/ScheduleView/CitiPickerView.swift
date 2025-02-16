//
//  CityPickerView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 16/02/2025.
//

import SwiftUI

struct CityPickerView: View {
    @StateObject private var cityVm = CityPickerViewModel()
    var body: some View {
        HStack(spacing: 0) {
            Button {
                cityVm.toogleCityList()
            } label: {
                selectedCityIcon(imgName: cityVm.selectedCity.name + "Logo")
            }
            if cityVm.showCitiesList {
                cities
            }
        }
        .background(.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    CityPickerView()
}

extension CityPickerView {
    private func selectedCityIcon(imgName: String) -> some View {
        ZStack {
            Image(imgName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: cityVm.selectedCitySize - 10, height: cityVm.selectedCitySize - 10)
                .opacity(cityVm.showCitiesList ? 0.3 : 1)
        }
        .frame(width: cityVm.selectedCitySize, height: cityVm.selectedCitySize)
        .animation(.none, value: cityVm.showCitiesList)
    }
    
    private var cities: some View {
        HStack {
            Divider()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 7){
                    ForEach(cityVm.unselectedCities, id: \.self) { city in
                        Button {
                            cityVm.selectedCity = city
                            cityVm.toogleCityList()
                            cityVm.updateUnselectedCities()
                        } label: {
                            HStack {
                                Image(city.name + "Logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: cityVm.selectedCitySize - 20, height: cityVm.selectedCitySize - 20)
                                Text(city.name)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 25))
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        .frame(width: cityVm.maximumCitiesScrollWidth, height: cityVm.selectedCitySize)
    }
}
