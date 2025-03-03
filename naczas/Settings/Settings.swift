//
//  Settings.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI

let screenSize = UIScreen.main.bounds.size
let touchVibrates = UIImpactFeedbackGenerator(style: .light)
let translucentTileSize: CGFloat = 65
let customTranslucentMaterial: Color = .gray.opacity(0.3)
let customThinTranslucentMaterial: Color = .gray.opacity(0.6)
let dimmedWhiteColor: Color = .white.opacity(0.3)

func differenceBetweenDate(lastUpdateString: String) -> Double? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let currentDate = Date()
    guard let lastUpdateDate = formatter.date(from: lastUpdateString) else { return nil }
    let differenceInMinutes = currentDate.timeIntervalSince(lastUpdateDate) / 60
    return differenceInMinutes
}
