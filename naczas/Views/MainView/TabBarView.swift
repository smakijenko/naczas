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
            tab(iconName: "calendar.badge.clock", tabName: AvailableTabsInTabBar.Rozkład)
        }
        .frame(width: tabVm.tabBarWidth, height: tabVm.tabBarHeight + 24)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
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
            } label: {
                VStack {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(tabName.name)
                        .font(.system(size: 13))
                }
                .foregroundStyle(tabName.name == tabVm.selectedTab.name ? .white : .white.opacity(0.3))
                .scaleEffect(tabName.name == tabVm.selectedTab.name ? 1.2 : 0.9)
                .frame(width: tabVm.tabBarWidth / 2)
                .frame(height: tabVm.tabBarHeight)
            }
        }
    }
}
