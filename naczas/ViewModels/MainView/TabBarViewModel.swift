//
//  TabBarViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import Foundation

class TabBarViewModel: ObservableObject {
    @Published var selectedTab: AvailableTabsInTabBar = .Home
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
}
