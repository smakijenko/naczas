//
//  MainView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 11/02/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVm = MainViewModel()
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                if mainVm.selectedTab == .Map {
                    MapView()
                }
                else if mainVm.selectedTab == .Schedule {
                    ScheduleView()
                }
                else {
                    Spacer()
                }
                TabBarView()
            }
            .transition(.opacity)
            .animation(.linear(duration: 0.1), value: mainVm.selectedTab)
            .environmentObject(mainVm)
        }
    }
}

#Preview {
    MainView()
}
