//
//  StopsView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 28/03/2025.
//

import SwiftUI

struct TestStop {
    let name: String
    let type: Int // 1 - permanent 2 - for request
}

let TestArr: [TestStop] = [
    TestStop(name: "Centrum", type: 1),
    TestStop(name: "Wilanowska", type: 2),
    TestStop(name: "Pl. Trzech Krzyży", type: 1),
    TestStop(name: "Mokotów Business Park", type: 2),
    TestStop(name: "Dworzec Główny", type: 1),
    TestStop(name: "Lotnisko Chopina", type: 2),
    TestStop(name: "Rondo ONZ", type: 1),
    TestStop(name: "Ursus Niedźwiadek", type: 2),
    TestStop(name: "Nowy Świat", type: 1),
    TestStop(name: "Targówek Fabryczny", type: 2),
    TestStop(name: "Muranów", type: 1),
    TestStop(name: "Pl. Bankowy", type: 1),
    TestStop(name: "Świętokrzyska", type: 1),
    TestStop(name: "Ochota Ratusz", type: 1),
    TestStop(name: "Metro Politechnika", type: 1),
    TestStop(name: "Stare Miasto", type: 1),
    TestStop(name: "Żelazna", type: 1),
    TestStop(name: "Most Gdański", type: 1),
    TestStop(name: "Dworzec Zachodni", type: 1),
    TestStop(name: "Powiśle", type: 1),
]

struct StopsView: View {
    let route: LineRouteModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(Array(TestArr.enumerated()), id: \.element.name) { index, stop in
                    HStack(alignment: .top) {
                        circleIndicator(type: stop.type, count: 20, index: index)
                        Button {
                            print(stop.name)
                        } label: {
                            Text(stop.name)
                                .font(.system(size: 16))
                                .foregroundStyle(.white)
                                .offset(y: 2)
                            if stop.type == 2 {
                                Text("NŻ")
                                    .font(.system(size: 16))
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.gray)
                                    .offset(y: 3)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        BackgroundView()
        StopsView(route: defaultRoute)
    }
}

extension StopsView {
    func circleIndicator(type: Int, count: Int, index: Int) -> some View {
        return VStack(spacing: 0) {
            if type == 2 {
                Circle()
                    .stroke(Color.white, lineWidth: 3)
                    .padding(.horizontal)
                    .frame(width: 55)
            }
            else {
                Circle()
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .frame(width: 55)
            }
            if count - 1 != index {
                Rectangle()
                    .foregroundStyle(.white)
                    .frame(width: 3, height: 40)
            }
        }
    }
}
