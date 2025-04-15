//
//  StopDeparturesView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 09/04/2025.
//

import SwiftUI

struct StopDeparturesView: View {
    @StateObject var departuresVm = StopDeparturesViewModel()
    let mainDepartures: [LineDeparturesForStopModel]
    let stopInfo: DecodedStopInfoModel
    let mainLine: String
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                possibleLinesForStop()
                    .padding(.horizontal)
                departuresList()
                    .padding(.horizontal)
                Spacer()
            }
        }
        .onAppear {
            Task {
                await departuresVm.provideLinesFromStop(stopGroupName: stopInfo.nrZespołu, stopNr: stopInfo.nrPrzystanku, mainLine: mainLine)
            }
        }
    }
}

#Preview {
    StopDeparturesView(mainDepartures: defaultDepartures, stopInfo: DecodedStopInfoModel(ulicaId: "0901", nrZespołu: "4011", nrPrzystanku: "05", typ: "1", szerGeo: "52.189736", dluGeo: "20.958956", nazwaZespołu: "Hynka"), mainLine: "189")
}

extension StopDeparturesView {
    func possibleLinesForStop() -> some View {
        return ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(departuresVm.linesFromStop, id: \.self) { line in
                        Button {
                            if departuresVm.selectedLines.contains(line) && mainLine != line{
                                departuresVm.selectedLines.removeAll(where: { $0 == line })
                            }
                            else {
                                departuresVm.selectedLines.append(line)
                            }
                        } label: {
                            Text(line)
                                .font(.system(size: 20))
                                .minimumScaleFactor(0.1)
                                .foregroundStyle(.white)
                                .frame(width: 50, height: 40)
                                .background(customTranslucentMaterial)
                                .cornerRadius(10)
                                .shadow(color: departuresVm.selectedLines.contains(line) ? .white : .clear, radius: 0)
                        }

                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: translucentTileSize)
    }
    
    func departuresList() -> some View {
        return ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                ForEach(mainDepartures, id: \.czas) { departure in
                    HStack {
                        Image(systemName: (allTramsLines.contains(mainLine) ? "tram" : "bus") + ".fill")
                        Text(departure.line)
                            .frame(width: 50, height: 35)
                            .background(customTranslucentMaterial)
                            .cornerRadius(10)
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 25, height: 10)
                        Text(departure.kierunek)
                        Spacer()
                        Text(departure.czas.trimTime())
                    }
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.1)
                }
            }
        }
    }
}
