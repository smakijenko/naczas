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
                        RouteStopsView(selectedPref: $stopsVm.selectedPref, route: $stopsVm.selectedRoute, showStopDepartures: $stopsVm.showStopDepartures, showMap: $stopsVm.showMap, line: line, showTabBar: stopsVm.showTabBar)
                    }
                    else {
                        ScrolableStopsListShimmer()
                    }
                    Spacer()
                }
                Spacer()
            }
            if stopsVm.isTabBarShown {
                withAnimation(.linear(duration: 0.2)) {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.6))
                        .gesture(slideGesture())
                        .ignoresSafeArea()
                }
            }
            VStack {
                Spacer()
                SchedMapTabBarView(showStopDepartures: $stopsVm.showStopDepartures, showMap: $stopsVm.showMap, hideTabBar: stopsVm.hideTabBar)
                    .offset(y: stopsVm.tabOffset)
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
        .ignoresSafeArea(edges: .bottom)
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
            touchVibrates.impactOccurred()
            dismiss()
        } label: {
            HStack(spacing: 2) {
                Image(systemName: "chevron.backward")
                Text("Wstecz")
            }
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.white)
        }
    }
    
    func slideGesture() -> some Gesture {
        DragGesture()
            .onChanged { gesture in
                if (0...200).contains(gesture.translation.height) {
                    stopsVm.tabOffset = gesture.translation.height
                }
            }
            .onEnded { _ in
                withAnimation(.linear(duration: 0.2)){
                    if stopsVm.tabOffset > 125 {
                        stopsVm.hideTabBar()
                    }
                    else{
                        stopsVm.tabOffset = -25
                    }
                }
            }
    }
}
