//
//  BusTramInfoAnnotation.swift
//  naczas
//
//  Created by Stanisław Makijenko on 28/04/2025.
//

import SwiftUI

struct BusTramInfoAnnotation: View {
    let time: String
    let scale: CGFloat
    var body: some View {
        ZStack {
            infoSign
                .overlay {
                    Text(time)
                        .foregroundStyle(.black)
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .minimumScaleFactor(0.1)
                }
        }
        .scaleEffect(scale)
    }
}

#Preview {
    BusTramInfoAnnotation(time:"22:30", scale: 0.75)
}

extension BusTramInfoAnnotation {
    private var infoSign: some View {
        ZStack{
            ZStack {
                Rectangle()
                    .frame(width: 77, height: 37)
                DownwardTriangle()
                    .frame(width: 19, height: 23)
                    .offset(y: 29)
            }
            .foregroundStyle(.black)
            ZStack {
                Rectangle()
                    .frame(width: 75, height: 35)
                DownwardTriangle()
                    .frame(width: 15, height: 20)
                    .offset(y: 29)
            }
            .foregroundStyle(.yellow)
        }
    }
}
