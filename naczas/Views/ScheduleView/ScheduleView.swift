//
//  ScheduleView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

struct ScheduleView: View {
    @State private var isCityPickerShown: Bool = false
    @State private var searchedText: String = ""
    @State private var transportType: AvailableTransportTypes = .Autobusy
    @State private var isOnlineTransportLoaded: Bool = false
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    CityPickerView(isCityPickerShown: $isCityPickerShown)
                        .padding(.leading)
                    Spacer()
                    LineSearcherView(isCityPickerShown: $isCityPickerShown, searchedText: $searchedText)
                        .padding(.trailing)
                }
                TransportTypePickerView(transportType: $transportType)
                    .padding(.horizontal)
                LegendView(isOnlineTransportLoaded: $isOnlineTransportLoaded)
                    .padding(.horizontal)
                LinesGridView(searchedText: $searchedText, transportType: $transportType, isOnlineTransportLoaded: $isOnlineTransportLoaded)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ScheduleView()
        .environmentObject(ActiveBusTramManager())
}
