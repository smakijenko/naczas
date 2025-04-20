//
//  StopDeparturesView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 09/04/2025.
//

import SwiftUI

struct StopDeparturesView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var departuresVm = StopDeparturesViewModel()
    let mainDepartures: [LineDeparturesForStopModel]
    let stopInfo: DecodedStopInfoModel
    let mainLine: String
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    possibleLinesForStop()
                        .padding(.horizontal, 8)
                        .zIndex(0)
                    Spacer()
                    dismissButton
                        .padding(.horizontal, 17)
                        .zIndex(1)
                }
                departuresList()
                    .padding(.horizontal, 5)
                Spacer()
            }
        }
        .onAppear {
            departuresVm.setMainLineMainDepartures(mainLine: mainLine, mainDepartures: mainDepartures)
            Task {
                await departuresVm.provideLinesFromStop(stopGroupName: stopInfo.nrZespołu, stopNr: stopInfo.nrPrzystanku)
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
                    ForEach(departuresVm.provideSortedKeyes(), id: \.self) { line in
                        Button {
                            touchVibrates.impactOccurred()
                            Task {
                                await departuresVm.checkForLineDepartures(stopGroupName: stopInfo.nrZespołu, stopNr: stopInfo.nrPrzystanku, lineNr: line)
                                await MainActor.run {
                                    departuresVm.updateDeparturesArray(lineNr: line)
                                }
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
        return ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(departuresVm.departuresArray, id: \.self) { departure in
                        HStack {
                            Image(systemName: (allTramsLines.contains(mainLine) ? "tram" : "bus") + ".fill")
                            Text(departure.line)
                                .font(.system(size: 20))
                                .frame(width: 50, height: 35)
                                .background(customTranslucentMaterial)
                                .cornerRadius(10)
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 25, height: 10)
                            Text(departure.kierunek.fixStopName())
                            Spacer()
                            Text(departuresVm.convertToNextTime(depTime: departure.czas))
                                .font(.system(size: 14))
                            Text(departure.czas.trimTime())
                        }
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 5)
                        .frame(height: 60)
                        .background(departure.line == mainLine && departuresVm.selectedLines.count > 1 ? .white.opacity(0.05) : .clear)
                        .cornerRadius(10)
                        .padding(.trailing, 7.5)
                        .id(departure.czas)
                    }
                }
            }
            .onChange(of: departuresVm.departuresArray) {
                withAnimation(.linear(duration: 0.4)) {
                    guard departuresVm.findClosestDeparture() != nil else { return }
                    proxy.scrollTo(departuresVm.findClosestDeparture(), anchor: .center)
                }
            }
        }
    }
    
    var dismissButton: some View {
        Button {
            touchVibrates.impactOccurred()
            dismiss()
        } label: {
            Image(systemName: "arrow.down")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .minimumScaleFactor(0.1)
                .foregroundStyle(.white)
                .frame(width: 50, height: 40)
                .background(customTranslucentMaterial)
                .cornerRadius(10)
        }
    }
}
