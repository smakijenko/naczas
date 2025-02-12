//
//  MainViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var selectedTab: AvailableTabsInTabBar = .Home
}
