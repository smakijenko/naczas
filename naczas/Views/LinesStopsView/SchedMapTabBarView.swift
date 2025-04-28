//
//  SchedMapTabBarView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/04/2025.
//

import SwiftUI

struct SchedMapTabBarView: View {
    @StateObject var tabVm = SchedMapTabBarViewModel()
    @Binding var showStopDepartures: Bool
    @Binding var showMap: Bool
    let hideTabBar: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            tab(iconName: "map", tabName: AvailableTabsInTabBar.Mapa)
            Divider()
            tab(iconName: "calendar.badge.clock", tabName: AvailableTabsInTabBar.Rozkład)
        }
        .background(tabVm.tabBarColor.opacity(0.95))
        .frame(width: tabVm.tabBarWidth, height:  tabVm.tabBarHeight)
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}

#Preview {
    SchedMapTabBarView(showStopDepartures: .constant(false), showMap: .constant(false), hideTabBar: {})
}

extension SchedMapTabBarView {
    private func tab(iconName: String, tabName: AvailableTabsInTabBar) -> some View {
        return ZStack{
            Button {
                touchVibrates.impactOccurred()
                if tabName == .Rozkład {
                    showStopDepartures.toggle()
                }
                else {
                    showMap.toggle()
                }
                hideTabBar()
            } label: {
                VStack {
                    Image(systemName: iconName)
                    Text(tabName.name)
                }
                .font(.system(size: 22))
                .foregroundStyle(.white)
                .frame(width: screenSize.width / 2)
                .frame(height: tabVm.tabBarHeight)
            }
        }
    }
}
