//
//  TabBarView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var tabVm = TabBarViewModel()
    @EnvironmentObject var mainVm: MainViewModel
    var body: some View {
        HStack(spacing: 0) {
            tab(iconName: "map", tabName: AvailableTabsInTabBar.Mapa)
            Divider()
            tab(iconName: "calendar.badge.clock", tabName: AvailableTabsInTabBar.Rozkład)
        }
        .background(LinearGradient(colors: tabVm.tabBarGradientColors, startPoint: .top, endPoint: .bottom))
        .frame(height: tabVm.tabBarHeight + 35)
    }
}

#Preview {
    ZStack {
        Color.white.ignoresSafeArea()
        TabBarView()
            .environmentObject(MainViewModel())
    }
}

extension TabBarView {
    private func tab(iconName: String, tabName: AvailableTabsInTabBar) -> some View {
        return ZStack{
            Button {
                touchVibrates.impactOccurred()
                tabVm.setSelectedTabAnim(selectedTab: tabName)
                mainVm.selectedTab = tabName
                Task {
                    try await GlobalCoreDataManager.shared.updateLineRoutesAndStops()
                    for line in GlobalCoreDataManager.shared.linesRoutes {
                        print(line.lineName)
                    }
                }
            } label: {
                VStack {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(tabName.name)
                        .font(.system(size: 13))
                }
                .foregroundStyle(tabName.name == tabVm.selectedTab.name ? .white : dimmedWhiteColor)
                .scaleEffect(tabName.name == tabVm.selectedTab.name ? 1.2 : 0.9)
                .frame(width: screenSize.width / 2)
                .frame(height: tabVm.tabBarHeight)
                .offset(y: -10)
            }
        }
    }
}
