//
//  naczasApp.swift
//  naczas
//
//  Created by Stanisław Makijenko on 11/02/2025.
//

import SwiftUI

@main
struct naczasApp: App {
    @StateObject private var manager = GlobalDataManager.shared
    @State var showLunchView: Bool = false
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showLunchView {
                    LunchView(showLunchView: $showLunchView)
                        .zIndex(2)
                        .transition(.opacity)
                }
                else {
                    MainView()
                        .zIndex(1)
                }
            }
            .environmentObject(manager)
            .preferredColorScheme(.dark)
            .animation(.linear(duration: 0.2), value: showLunchView)
        }
    }
}
