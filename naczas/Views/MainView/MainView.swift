//
//  MainView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 11/02/2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gdManager: GlobalDataManager
    @EnvironmentObject var btManager: ActiveBusTramManager
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
            await gdManager.updateLineRoutesAndStops()
            await btManager.loadActiveBusesTrams()
        }
        .alert(isPresented: $gdManager.showSwiftDataIssueAlert) {
            Alert(
                title: Text("Błąd!"),
                message: Text(gdManager.swiftDataIssuealertMessage),
                primaryButton: .default(Text("Spróbuj ponownie"), action: {
                    Task {
                        await gdManager.retryUpdate()
                    }
                }),
                secondaryButton: .cancel(Text("Ok"))
                )
        }
        .alert(isPresented: $btManager.showNoBusTramsAlert) {
            Alert(
                title: Text("Błąd!"),
                message: Text(btManager.noBusTramsAlertMessage),
                primaryButton: .default(Text("Spróbuj ponownie"), action: {
                    Task {
                        await btManager.loadActiveBusesTrams()
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
        .environmentObject(ActiveBusTramManager())
}
