//
//  MainView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 11/02/2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var manager: GlobalDataManager
    @StateObject var mainVm = MainViewModel()
    var body: some View {
        ZStack {
            BackgroundView()
                if mainVm.selectedTab == .Mapa {
                    MapView()
                }
                else if mainVm.selectedTab == .Rozkład {
                    ScheduleView()
                }
            VStack {
                Spacer()
                TabBarView()
            }
            .ignoresSafeArea()
        }
        .transition(.opacity)
        .animation(.linear(duration: 0.1), value: mainVm.selectedTab)
        .environmentObject(mainVm)
        .task {
            await manager.updateLineRoutesAndStops()
        }
        .alert(isPresented: $manager.showSwiftDataIssueAlert) {
            Alert(
                title: Text("Błąd!"),
                message: Text(manager.swiftDataIssuealertMessage),
                primaryButton: .default(Text("Spróbuj ponownie"), action: {
                    Task {
                        await manager.retryUpdate()
                    }
                }),
                secondaryButton: .cancel(Text("Ok"))
                )
        }
    }
}

#Preview {
    MainView()
        .environmentObject(GlobalDataManager())
}
