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
                TransportTypePickerView()
                    .padding(.horizontal)
                LinesGridView(searchedText: $searchedText)
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(width: screenSize.width, height: 85)
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ScheduleView()
}
