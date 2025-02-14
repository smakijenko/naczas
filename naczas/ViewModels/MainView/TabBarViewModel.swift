//
//  TabBarViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import Foundation
import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var selectedTab: AvailableTabsInTabBar = .Rozkład
    var tabBarWidth: CGFloat = 0
    let tabBarHeight: CGFloat = 50
    
    init() {
        adjustTabBarSize()
    }
    
    func adjustTabBarSize() {
        let width = screenSize.width * 0.89
        if width > 550 {
            tabBarWidth = 550
            return
        }
        tabBarWidth = width
    }
    
    func setSelectedTabAnim(selectedTab: AvailableTabsInTabBar) {
        withAnimation(.easeInOut(duration: 0.1)) {
            self.selectedTab = selectedTab
        }
    }
}
