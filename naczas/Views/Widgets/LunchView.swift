//
//  LunchView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 13/02/2025.
//

import SwiftUI

class LunchViewModel: ObservableObject {
    @Published var busNarrowDegree: CGFloat = 0
    let duarationBetweenClicks: CGFloat = 0.85
    let bgGradientColors = [
        Color(red: 0.0/255.0, green: 82.0/255.0, blue: 212.0/255.0),
        Color(red: 101.0/255.0, green: 199.0/255.0, blue: 247.0/255.0),
        Color(red: 156.0/255.0, green: 236.0/255.0, blue: 251.0/255.0)
    ]
    var elapsedTime: Double = 0
    
    func addDegree() {
        if busNarrowDegree < 90 {
            touchVibrates.impactOccurred()
        }
        withAnimation(.easeInOut(duration: 0.1)) {
            busNarrowDegree += 30
        }
    }
}

struct LunchView: View {
    @Binding var showLunchView: Bool
    @StateObject private var lunchVm = LunchViewModel()
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            BackgroundView()
            ZStack {
                Image("clockFaceLogo")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                Image("busLogo")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: lunchVm.busNarrowDegree))
            }
            .frame(width: screenSize.width * 0.35)
            .foregroundStyle(.linearGradient(colors: lunchVm.bgGradientColors, startPoint: .top, endPoint: .bottom))
            .shadow(radius: 10)
        }
        .onReceive(timer, perform: { _ in
            lunchVm.elapsedTime += 0.1
            if lunchVm.busNarrowDegree >= 90 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                    showLunchView = false
                })
            }
            if lunchVm.elapsedTime >= lunchVm.duarationBetweenClicks {
                lunchVm.elapsedTime = 0
                lunchVm.addDegree()
            }
        })
    }
}

#Preview {
    LunchView(showLunchView: .constant(true))
}
