//
//  DownwardTriangle.swift
//  naczas
//
//  Created by Stanisław Makijenko on 28/04/2025.
//

import SwiftUI

struct DownwardTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topLeft = CGPoint(x: rect.minX, y: rect.minY)
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomMiddle = CGPoint(x: rect.midX, y: rect.maxY)
        
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomMiddle)
        path.closeSubpath()
        
        return path
    }
}
