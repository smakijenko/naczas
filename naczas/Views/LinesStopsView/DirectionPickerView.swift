//
//  RoutePickerTabBar.swift
//  naczas
//
//  Created by Stanisław Makijenko on 28/03/2025.
//

import SwiftUI
import Shimmer

struct DirectionPickerView: View {
    @Binding var selectedRoute: PreferredRouteModel
    let routes: [PreferredRouteModel]
    let isDataLoaded: Bool
    var body: some View {
        ZStack {
            if isDataLoaded { routesTabBar }
            else { routesTabBarShimmer }
        }
        .frame(maxWidth: .infinity)
        .frame(height: translucentTileSize)
        .background(customTranslucentMaterial)
        .cornerRadius(10)
        .shadow(radius: 3)
        .padding()
    }
}

#Preview {
    DirectionPickerView(selectedRoute: .constant(PreferredRouteModel(routeName: "TD-5NAR", direction: "pl.Narutowicza")), routes: [PreferredRouteModel(routeName: "TD-5NAR", direction: "Pl.Narutowicza"), PreferredRouteModel(routeName: "TX-A04ZN", direction: "Annopol")], isDataLoaded: true)
}

extension DirectionPickerView {
    private var routesTabBar: some View {
        HStack {
            route(route: routes[0])
            Spacer()
            directionIcon()
            Spacer()
            route(route: routes[1])
        }
        .padding(.horizontal)
    }
    
    private var routesTabBarShimmer: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(maxWidth: .infinity)
            .frame(height: translucentTileSize / 2.25)
            .foregroundStyle(.shimmerGray)
            .shimmering(bandSize: 1)
            .padding(.horizontal)
    }
    
    func route(route: PreferredRouteModel) -> some View {
        return Button {
            touchVibrates.impactOccurred()
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedRoute = route
            }
        } label: {
            Text(route.direction.fixStopName())
                .font(.system(size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundStyle(route.routeName == selectedRoute.routeName ? .white : dimmedWhiteColor)
                .scaleEffect(route.routeName == selectedRoute.routeName ? 1.15 : 0.9)
                .frame(maxWidth: (screenSize.width - 20) / 2)
                .minimumScaleFactor(0.1)
        }
    }
    
    func directionIcon() -> some View {
        return ZStack {
            Image("DirectionIcon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
        }
    }
}

