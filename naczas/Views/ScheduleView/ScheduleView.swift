//
//  ScheduleView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    CityPickerView()
                        .padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ScheduleView()
}
