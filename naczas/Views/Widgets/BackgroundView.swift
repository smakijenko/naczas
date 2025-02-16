//
//  BackgroundView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

class BackgroundViewModel: ObservableObject {
    let bgGradientColors = [
        Color(red: 61.0/255.0, green: 110.0/255.0, blue: 148.0/255.0),
        Color(red: 70.0/255.0, green: 107.0/255.0, blue: 120.0/255.0),
        Color(red: 15.0/255.0, green: 32.0/255.0, blue: 39.0/255.0)
        
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
