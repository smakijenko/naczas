//
//  LunchView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 13/02/2025.
//

import SwiftUI

class LunchViewModel: ObservableObject {
    @Published var timer = Timer()
    @Published var busNarrowDegree: CGFloat = 0
    private let duarationBetweenClicks: CGFloat = 0.85
    let bgGradientColors = [
        Color(red: 0.0/255.0, green: 82.0/255.0, blue: 212.0/255.0),
        Color(red: 101.0/255.0, green: 199.0/255.0, blue: 247.0/255.0),
        Color(red: 156.0/255.0, green: 236.0/255.0, blue: 251.0/255.0)
    ]
    var elapsedTime: Double = 0
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.elapsedTime += 0.1
            if self.elapsedTime >= self.duarationBetweenClicks {
                self.elapsedTime = 0
                self.addDegree()
            }
        }
    }
    
    private func addDegree() {
        withAnimation(.easeInOut(duration: 0.1)) {
            busNarrowDegree += 30
            touchVibrates.impactOccurred()
        }
    }
    
    func stopTimer() {
        timer.invalidate()
    }
}

struct LunchView: View {
    @Binding var showLunchView: Bool
    @StateObject private var lunchVm = LunchViewModel()
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
            .frame(width: 175)
            .foregroundStyle(.linearGradient(colors: lunchVm.bgGradientColors, startPoint: .top, endPoint: .bottom))
            .shadow(radius: 10)
        }
        .onChange(of: lunchVm.busNarrowDegree) {
            if lunchVm.busNarrowDegree >= 90 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.lunchVm.stopTimer()
                    self.showLunchView = false
                }
            }
        }
    }
}

#Preview {
    LunchView(showLunchView: .constant(true))
}
