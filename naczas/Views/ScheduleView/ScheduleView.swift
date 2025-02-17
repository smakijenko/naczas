//
//  ScheduleView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

struct ScheduleView: View {
    @State private var isCityPickerShown: Bool = false
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    CityPickerView(isCityPickerShown: $isCityPickerShown)
                        .padding(.leading)
                    Spacer()
                    LineSearcherView(isCityPickerShown: $isCityPickerShown)
                        .padding(.trailing)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ScheduleView()
}
