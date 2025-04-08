//
//  RouteStopsViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 30/03/2025.
//

import Foundation

class RouteStopsViewModel: ObservableObject {
    @Published var encodedStops: [DecodedStopInfoModel] = []
    @Published var isDataLoaded: Bool = false
    @Published var stopDepartures: [Int: [LineDeparturesForStopModel]] = [:]
    @Published var departuresAvailable: [Int: Bool] = [:]
    @Published var unloadedArray: [Int] = []
    
    func encodeStopValues(stops: [StopInRouteInfoModel], enteties: [StopEntity]) {
        for stop in stops {
            if let entity = enteties.first(where: { $0.stopKeys.idUlicy == stop.ulicaID && $0.stopKeys.zespol == stop.nrZespolu && $0.stopKeys.slupek == stop.nrPrzystanku }) {
                encodedStops.append(DecodedStopInfoModel(
                    ulicaId: stop.ulicaID,
                    nrZespołu: stop.nrZespolu,
                    nrPrzystanku: stop.nrPrzystanku,
                    typ: stop.typ,
                    szerGeo: entity.stopValues.szerGeo,
                    dluGeo: entity.stopValues.dlugGeo,
                    nazwaZespołu: entity.stopValues.nazwaZespolu
                ))
            }
        }
        if !encodedStops.isEmpty { isDataLoaded = true }
    }
    
    func howMuchToNext(index: Int) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let currentTimeString = dateFormatter.string(from: Date())
        guard let departures = stopDepartures[index]?.sorted(by: { $0.czas < $1.czas }) else { return nil }
        for dep in departures {
            if dep.czas > currentTimeString {
                let splitedCurrent = currentTimeString.split(separator: ":").map { Int($0)! }
                let splittedDep = dep.czas.split(separator: ":").map { Int($0)! }
                guard splitedCurrent.count == 3, splittedDep.count == 3 else { continue }
                let minutes1 = splitedCurrent[0] * 60 + splitedCurrent[1]
                let minutes2 = splittedDep[0] * 60 + splittedDep[1]
                return (minutes2 - minutes1)
            }
        }
        return nil
    }
    
    func convertToNextTime(index: Int) -> String {
        let minutes = howMuchToNext(index: index)
        guard let minutes = minutes else { return "?" }
        if minutes <= 60 { return "\(minutes)min"}
        else { return ">60min" }
    }
    
    func resetSettings() {
        isDataLoaded = false
        encodedStops.removeAll()
        stopDepartures = [:]
        departuresAvailable = [:]
        unloadedArray = []
    }
    
    func provideDeparturesForStops(line: String) async {
        print("Started providing departure times for stops.")
        for index in 0 ..< encodedStops.count {
            for attempt in 1 ... 5 {
                print("Attempt \(attempt) for index \(index)")
                do {
                    let departuresTimesResponse = try await LineDeparturesForStopManager().fetchAllAvailableLines(
                        stopGroupName: encodedStops[index].nrZespołu,
                        stopNr: encodedStops[index].nrPrzystanku,
                        lineNr: line)
                    await MainActor.run {
                        stopDepartures[index] = departuresTimesResponse
                        departuresAvailable[index] = true
                    }
                    break
                }
                catch {
                    print("Attempt \(attempt) for index \(index), failed with error: \(error)")
                    if attempt == 5 {
                        await MainActor.run {
                            unloadedArray.append(index)
                        }
                    }
                }
            }
        }
    }
}
