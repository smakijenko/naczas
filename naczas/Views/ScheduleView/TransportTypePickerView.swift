//
//  TransportTypePickerView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 17/02/2025.
//

import SwiftUI

struct TransportTypePickerView: View {
    @StateObject var typeVm = TransportTypePickerViewModel()
    @Binding var transportType: AvailableTransportTypes
    var body: some View {
        ZStack {
            HStack {
                typeButton(sf: "bus", type: AvailableTransportTypes.Autobusy)
                Divider()
                typeButton(sf: "tram", type: AvailableTransportTypes.Tramwaje)
            }
            .frame(height: translucentTileSize)
        }
        .background(customTranslucentMaterial)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    TransportTypePickerView(transportType: .constant(.Autobusy))
}

extension TransportTypePickerView {
    private func typeButton(sf: String, type: AvailableTransportTypes) -> some View {
        Button {
            touchVibrates.impactOccurred()
            typeVm.changeSelectedType(type: type)
            transportType = type
            Task {
                do {
                    print(try await AvailableLinesManager().provideOnlineUniqueLines(transportType: .Autobusy))
                }
                catch {
                    print(error)
                }
            }
        } label: {
            HStack {
                Image(systemName: sf)
                Text(type.name)
            }
            .foregroundStyle(type.name == typeVm.selectedType.name ? .white : dimmedWhiteColor)
            .scaleEffect(type.name == typeVm.selectedType.name ? 1.2 : 0.9)
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .font(.system(size: 20))
        }
    }
}
