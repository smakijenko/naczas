//
//  CityPickerView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 16/02/2025.
//

import SwiftUI

struct CityPickerView: View {
    @StateObject private var cityVm = CityPickerViewModel()
    @Binding var isCityPickerShown: Bool
    var body: some View {
        HStack(spacing: 0) {
            Button {
                touchVibrates.impactOccurred()
                withAnimation(.easeInOut(duration: 0.2)) {
                    isCityPickerShown.toggle()
                }
            } label: {
                selectedCityIcon(imgName: cityVm.selectedCity.name + "Logo")
            }
            if isCityPickerShown {
                cities
            }
        }
        .background(.gray.opacity(0.3))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    CityPickerView(isCityPickerShown: .constant(true))
}

extension CityPickerView {
    private func selectedCityIcon(imgName: String) -> some View {
        ZStack {
            Image(imgName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: translucentTileSize - 10, height: translucentTileSize - 10)
                .opacity(cityVm.showCitiesList ? 0.3 : 1)
        }
        .frame(width: translucentTileSize, height: translucentTileSize)
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
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isCityPickerShown.toggle()
                            }
                            cityVm.updateUnselectedCities()
                        } label: {
                            HStack {
                                Image(city.name + "Logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: translucentTileSize - 25, height: translucentTileSize - 25)
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
        .frame(maxWidth: .infinity)
        .frame(height: translucentTileSize)
    }
}
