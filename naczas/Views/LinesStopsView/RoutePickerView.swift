//
//  RoutePickerView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 22/02/2025.
//

import SwiftUI
import Shimmer

struct RoutePickerView: View {
    @StateObject var routesVm = RoutePickerViewModel()
    @EnvironmentObject var stopsVm: LineStopsViewModel
    @Binding var areRoutesLoaded: Bool
    var body: some View {
        VStack(spacing: 0) {
            Button {
                touchVibrates.impactOccurred()
                if areRoutesLoaded {
                    routesVm.showRoutesList()
                }
            } label: {
                selectedRouteIcon()
            }
            if routesVm.isRoutesListShown {
                routes()
            }
        }
        .background(customTranslucentMaterial)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    RoutePickerView(areRoutesLoaded: .constant(false))
        .environmentObject(LineStopsViewModel())
}

extension RoutePickerView {
    private func selectedRouteIcon() -> some View {
        return ZStack {
            if areRoutesLoaded {
                Text(stopsVm.selectedRoute.routeName)
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                    .opacity(routesVm.isRoutesListShown ? 0.3 : 1)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
            }
            else {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: translucentTileSize * 1.75, height: translucentTileSize / 2)
                    .foregroundStyle(.shimmerGray)
                    .shimmering(bandSize: 1)
            }
        }
        .frame(width: translucentTileSize * 2, height: translucentTileSize)
        .animation(.none, value: routesVm.isRoutesListShown)
    }
    
    private func routes() -> some View {
        return VStack {
            Divider()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(stopsVm.lineRoutes, id: \.routeName) { route in
                        Text(route.routeName)
                            .font(.system(size: 24))
                            .foregroundStyle(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                    }
                }
            }
        }
        .frame(width: translucentTileSize * 2, height: translucentTileSize * 3)
    }
}
