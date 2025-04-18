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
    let line: String
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                VStack(alignment: .leading, spacing: 0) {
                    if routeStopVm.isDataLoaded {
                        ForEach(routeStopVm.encodedStops.indices, id: \.self) { index in
                            HStack(alignment: .top) {
                                circleIndicator(type: routeStopVm.encodedStops[index].typ, count: routeStopVm.encodedStops.count, index: index)
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
                .padding(.vertical)
                .onChange(of: route.routeName) {
                    if routeStopVm.isDataLoaded {
                        withAnimation(.linear(duration: 0.2)) {
                            proxy.scrollTo(0, anchor: .top)
                        }
                    }
                    routeStopVm.resetSettings()
                    routeStopVm.encodeStopValues(stops: route.stops, enteties: gdManager.stops)
                    Task {
                        await routeStopVm.provideDeparturesForStops(line: line)
                    }
                }
            }
        }
        .onAppear {
            Task {
//                await gdManager.updateLineRoutesAndStops() // for preview
                routeStopVm.resetSettings()
                routeStopVm.encodeStopValues(stops: route.stops, enteties: gdManager.stops)
                Task {
                    await routeStopVm.provideDeparturesForStops(line: line)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        BackgroundView()
        RouteStopsView (
            selectedPref: .constant(PreferredRouteModel(routeName: "Default", direction: "Default")),
            route: .constant(defaultRoute), line: "189")
        .environmentObject(GlobalDataManager())
    }
}

extension RouteStopsView {
    private func createStopForList(index: Int) -> some View {
        return Button {
            guard let departures = routeStopVm.stopDepartures[index] else { return }
            for item in departures.sorted(by: { $0.czas < $1.czas }) {
                print(item)
            }
            print(routeStopVm.encodedStops[index])
        } label: {
            Text(routeStopVm.encodedStops[index].nazwaZespołu.fixStopName())
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .offset(y: 2)
            if routeStopVm.encodedStops[index].typ == "2" {
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
