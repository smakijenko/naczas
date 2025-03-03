//
//  BackgroundView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

class BackgroundViewModel: ObservableObject {
    let bgGradientColors = [
        Color(red: 67.0/255.0, green: 70.0/255.0, blue: 71.0/255.0),
        Color(red: 35.0/255.0, green: 37.0/255.0, blue: 38.0/255.0)
    ]
}

struct BackgroundView: View {
    @StateObject private var bgVm = BackgroundViewModel()
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: bgVm.bgGradientColors, startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
