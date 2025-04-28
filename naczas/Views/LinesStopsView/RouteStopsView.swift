//
//  RouteStopsView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 28/03/2025.
//

import SwiftUI
import Shimmer

struct RouteStopsView: View {
    @EnvironmentObject var gdManager: GlobalDataManager
    @StateObject var routeStopVm = RouteStopsViewModel()
    @Binding var selectedPref: PreferredRouteModel
    @Binding var route: RouteForLineModel
    @Binding var showStopDepartures: Bool
    @Binding var showMap: Bool
    let line: String
    let showTabBar: () -> Void
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ScrollView {
                    stopsList
                        .padding(.vertical)
                        .onChange(of: route.routeName) {
                            if routeStopVm.isDataLoaded {
                                withAnimation(.linear(duration: 0.2)) {
                                    proxy.scrollTo(0, anchor: .top)
                                }
                            }
                            routeStopVm.resetSettings()
                            routeStopVm.provideDecodedStops(stops: route.stops, enteties: gdManager.stops)
                            Task {
                                await routeStopVm.provideDeparturesForStops(line: line)
                            }
                        }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            Task {
//                await gdManager.updateLineRoutesAndStops() // for preview
                routeStopVm.resetSettings()
                routeStopVm.provideDecodedStops(stops: route.stops, enteties: gdManager.stops)
                await routeStopVm.provideDeparturesForStops(line: line)
            }
        }
        .sheet(isPresented: $showStopDepartures) {
            if let dep = routeStopVm.stopDepartures[routeStopVm.indexForNextView] {
                StopDeparturesView(mainDepartures: dep.sorted( by: { $0.czas < $1.czas }), stopInfo: routeStopVm.decodedStops[routeStopVm.indexForNextView], mainLine: line)
            }
        }
        .sheet(isPresented: $showMap) {
            if let dep = routeStopVm.stopDepartures[routeStopVm.indexForNextView] {
                MapView(departures: dep.sorted( by: { $0.czas < $1.czas }), selectedIndex: routeStopVm.indexForNextView, stops: routeStopVm.decodedStops, line: line)
            }
        }
    }
}

#Preview {
    ZStack {
        BackgroundView()
        RouteStopsView (
            selectedPref: .constant(PreferredRouteModel(routeName: "Default", direction: "Default")),
            route: .constant(defaultRoute),showStopDepartures: .constant(false), showMap: .constant(false), line: "189", showTabBar: {})
        .environmentObject(GlobalDataManager())
    }
}

extension RouteStopsView {
    var stopsList: some View {
        VStack(alignment: .leading, spacing: 0) {
            if routeStopVm.isDataLoaded {
                ForEach(routeStopVm.decodedStops.indices, id: \.self) { index in
                    HStack(alignment: .top) {
                        circleIndicator(type: routeStopVm.decodedStops[index].typ, count: routeStopVm.decodedStops.count, index: index)
                        createStopForList(index: index)
                        Spacer()
                        scheduleIndicator(index: index, isData: routeStopVm.departuresAvailable[index] ?? false)
                    }
                    .frame(maxWidth: .infinity)
                    .id(index)
                }
            }
            else {
                ScrolableStopsListShimmer()
            }
        }
    }
    
    private func createStopForList(index: Int) -> some View {
        return Button {
            touchVibrates.impactOccurred()
            routeStopVm.indexForNextView = index
            showTabBar()
        } label: {
            Text(routeStopVm.decodedStops[index].nazwaZespołu.fixStopName())
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .offset(y: 2)
            if routeStopVm.decodedStops[index].typ == "2" {
                Text("NŻ")
                    .font(.system(size: 16))
                    .fontWeight(.heavy)
                    .foregroundStyle(.gray)
                    .offset(y: 3)
            }
        }
    }
    
    private func circleIndicator(type: String, count: Int, index: Int) -> some View {
        return VStack(spacing: 0) {
            if type == "2" {
                Circle()
                    .stroke(Color.white, lineWidth: 3)
                    .padding(.horizontal)
                    .frame(width: 55)
            }
            else {
                Circle()
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .frame(width: 55)
            }
            if count - 1 != index {
                Rectangle()
                    .foregroundStyle(.white)
                    .frame(width: 3, height: 40)
            }
        }
    }
    
    private func scheduleIndicator(index: Int, isData: Bool) -> some View {
        return ZStack {
            if routeStopVm.unloadedArray.contains(index) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(.red)
                        .glow(radius: 10)
                    Image(systemName: "xmark")
                        .frame(width: 20, height: 20)
                }
            }
            else if routeStopVm.departuresAvailable[index] != nil {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(.green)
                        .glow(radius: 10)
                    Text(routeStopVm.convertToNextTime(index: index))
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .minimumScaleFactor(0.1)
                }
            }
            else {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.shimmerGray)
                    .shimmering(bandSize: 1)
            }
        }
        .frame(width: 75, height: 30)
        .padding(.trailing)
    }
}
