//
//  MainViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var selectedTab: AvailableTabsInTabBar = .Rozkład
}
