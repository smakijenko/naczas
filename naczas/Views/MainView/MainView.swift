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
    @StateObject var bridge = LineStopBridge()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                ScheduleView()
            }
            .transition(.opacity)
            .animation(.linear(duration: 0.1), value: mainVm.selectedTab)
            .environmentObject(btManager)
            .environmentObject(bridge)
            .onAppear {
                if !bridge.wasLineStopsSelected {
                    Task {
                        await gdManager.updateLineRoutesAndStops()
                        await btManager.loadActiveBusesTrams()
                    }
                }
            }
            .alert(isPresented: .constant(gdManager.showSwiftDataIssueAlert || btManager.showNoBusTramsAlert)) {
                if gdManager.showSwiftDataIssueAlert {
                    swiftDataAlert
                }
                else {
                    noBusTramAlert
                }
            }
            .navigationDestination(isPresented: $bridge.showLineStopsView.0) {
                LineStopsView(isSheetShown: $bridge.showLineStopsView.0, line: bridge.showLineStopsView.1)
            }
        }
        .tint(.white)
    }
}

#Preview {
    MainView()
        .environmentObject(GlobalDataManager())
        .environmentObject(ActiveBusTramManager())
}

extension MainView {
    private var noBusTramAlert: Alert {
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
    
    private var swiftDataAlert: Alert {
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
}
