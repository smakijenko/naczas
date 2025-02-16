//
//  ScheduleView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var mainVm: MainViewModel
    var body: some View {
        ZStack {
            BackgroundView()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ScheduleView()
        .environmentObject(MainViewModel())
}
