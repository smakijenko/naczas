//
//  RouteStopsView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 28/03/2025.
//

import SwiftUI

struct RouteStopsView: View {
    @EnvironmentObject var manager: GlobalDataManager
    @StateObject var routeStopVm = RouteStopsViewModel()
    @Binding var selectedPref: PreferredRouteModel
    @Binding var route: LineRouteModel
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                VStack(alignment: .leading, spacing: 0) {
                    if routeStopVm.isDataLoaded {
                        ForEach(routeStopVm.encodedStops.indices, id: \.self) { index in
                            HStack(alignment: .top) {
                                circleIndicator(type: routeStopVm.encodedStops[index].typ, count: routeStopVm.encodedStops.count, index: index)
                                Button {
                                    //TODO
                                } label: {
                                    Text(routeStopVm.encodedStops[index].nazwaZespołu)
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
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .id(index)
                        }
                    }
                    else {
                        ScrolableStopsListShimmer()
                    }
                }
                .onChange(of: route.routeName) {
                    if routeStopVm.isDataLoaded {
                        withAnimation(.linear(duration: 0.2)) {
                            proxy.scrollTo(0, anchor: .top)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
//                await manager.updateLineRoutesAndStops() // for preview
                routeStopVm.encodeStopValues(stops: route.stops, enteties: manager.stops)
            }
        }
        .onChange(of: route.routeName, {
            routeStopVm.isDataLoaded = true
            routeStopVm.encodedStops.removeAll()
            routeStopVm.encodeStopValues(stops: route.stops, enteties: manager.stops)
        })
    }
}

#Preview {
    ZStack {
        BackgroundView()
        RouteStopsView (
            selectedPref: .constant(PreferredRouteModel(routeName: "Default", direction: "Default")),
            route: .constant(defaultRoute))
        .environmentObject(GlobalDataManager())
    }
}

extension RouteStopsView {
    func circleIndicator(type: String, count: Int, index: Int) -> some View {
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
}
