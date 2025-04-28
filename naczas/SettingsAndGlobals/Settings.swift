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
let customThinTranslucentMaterial: Color = .black.opacity(0.3)
let dimmedWhiteColor: Color = .white.opacity(0.3)

let allowedCharsInSearchFiled: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "n"]
