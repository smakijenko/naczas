//
//  LineStopsView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import SwiftUI

struct LineStopsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gdManager: GlobalDataManager
    @StateObject var stopsVm = LineStopsViewModel()
    @Binding var isSheetShown: Bool
    let line: String
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                DirectionPickerView(selectedRoute: $stopsVm.selectedPref, routes: stopsVm.preferredRoutes, isDataLoaded: stopsVm.areRoutesLoaded)
                HStack {
                    if stopsVm.areRoutesLoaded {
                        RouteStopsView(selectedPref: $stopsVm.selectedPref, route: $stopsVm.selectedRoute, line: line)
                    }
                    else {
                        ScrolableStopsListShimmer()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .environmentObject(stopsVm)
        .onAppear {
            Task {
                do {
//                    await gdManager.updateLineRoutesAndStops() // -> for preview
                    try stopsVm.providePreferredRoutesForLine(line: line)
                    try stopsVm.provideRoutes(entities: gdManager.linesRoutes, line: line)
                }
                catch {
                    print("Alert: Could not fetch main routes.")
                    stopsVm.showNoRouteAlert = true
                }
            }
        }
        .onChange(of: stopsVm.selectedPref.routeName) {
            stopsVm.updateSelectedRoute()
        }
        .alert(isPresented: $stopsVm.showNoRouteAlert) {
            Alert(
                title: Text("Błąd!"),
                message: Text(stopsVm.noRouteAlertMessage),
                dismissButton: .default(Text("Powrót"), action: {
                    isSheetShown = false
                }))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

#Preview {
    LineStopsView (
        isSheetShown: .constant(true),
        line: "189")
        .environmentObject(GlobalDataManager())
}

extension LineStopsView {
    var btnBack : some View {
        Button {
            dismiss()
        } label: {
            Text("<Wstecz")
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.white)
        }
    }
}
