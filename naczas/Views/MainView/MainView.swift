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
                if mainVm.selectedTab == .Mapa {
                    MapView()
                }
                else if mainVm.selectedTab == .Rozkład {
                    ScheduleView()
                }
                TabBarView()
            }
            .transition(.opacity)
            .animation(.linear(duration: 0.1), value: mainVm.selectedTab)
            .environmentObject(mainVm)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
