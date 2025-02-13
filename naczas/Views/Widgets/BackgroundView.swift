//
//  BackgroundView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

class BackgroundViewModel: ObservableObject {
    let bgGradientColors = [
        Color(red: 0.0/255.0, green: 82.0/255.0, blue: 212.0/255.0),
        Color(red: 101.0/255.0, green: 199.0/255.0, blue: 247.0/255.0),
        Color(red: 156.0/255.0, green: 236.0/255.0, blue: 251.0/255.0)
        
    ]
}

struct BackgroundView: View {
    @StateObject private var bgVm = BackgroundViewModel()
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: bgVm.bgGradientColors, startPoint: .bottom, endPoint: .top))
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
