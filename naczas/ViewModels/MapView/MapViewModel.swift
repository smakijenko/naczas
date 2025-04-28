//
//  MapViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 24/04/2025.
//

import Foundation
import MapKit
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var mapPosition: MapCameraPosition = .firstCamPosition
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var showBusTramInfo: Bool = false
    @Published var elapsedTime: Int = 0
    @Published var availableBrigades: [LineDeparturesForStopModel] = []
    @Published var stopsSelectionStates: [Int : Bool] = [:]
    @Published var transportToShow: ([ActiveBusTramModel], [String]) = ([], [])
    @Published var showNoBrigadesAlert: Bool = false
    @Published var showManyFailedAttemptsFetchingActivesAlert: Bool = false
    let manyFailedAttempsAlertText = "Od ponad minuty pozycje pojazdów nie zostały zaktualizowane, wybierz przystanek ponownie lub kontunuuj z ostatnimi pozycjami."
    let noBrigadesToShowAlertText = "Aktualnie żaden pojazd nie jedzie do wybranego przystanku."
    var textInAlert: String = ""
    var attemptsCouter: Int = 0
    private var timer = Timer()
    
    init() {
//        startTimer()
    }
    
    deinit {
        stopTimer()
    }
    
    func setPosToSelectedStop(selectedStop: DecodedStopInfoModel) {
        guard let lat = Double(selectedStop.szerGeo), let lon = Double(selectedStop.dluGeo) else { return }
        mapPosition = MapCameraPosition.region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: lat, longitude: lon),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.elapsedTime += 1
        }
    }
    
    private func stopTimer() {
        timer.invalidate()
    }
    
    func provideAvailableBrigades(departures: [LineDeparturesForStopModel]) throws {
        var brigadesToShow: [LineDeparturesForStopModel] = []
        var allowLastOne: Bool = true
        for (index, dep) in departures.enumerated() {
            let howMuchTime = howMuchToNext(depTime: dep.czas)
            guard let howMuchTime = howMuchTime else { continue }
            if 0 ... 60 ~= howMuchTime {
                brigadesToShow.append(dep)
                if allowLastOne && 0 ..< departures.count ~= (index - 1) {
                    brigadesToShow.insert(departures[index - 1], at: 0)
                    allowLastOne = false
                }
            }
        }
        guard !brigadesToShow.isEmpty else { throw MyError.APIResponseEmpty }
        availableBrigades = brigadesToShow
    }
    
    func fillIndexStopPairs(indexes: Int, selectedIndex: Int) {
        for i in 0 ..< indexes {
            if i != selectedIndex {
                stopsSelectionStates[i] = false
            }
            else {
                stopsSelectionStates[i] = true
            }
        }
    }
    
    func updateActiveBusesTrams(line: String, manager: ActiveBusTramManager) async throws {
        print("Pobieram, elapsed time: \(elapsedTime)")
        if allTramsLines.contains(line) {
            try await manager.provideActiveTrams()
        }
        else {
            try await manager.provideActiveBuses()
        }
    }
    
    func provideTransportToShow(actives: [String : [ActiveBusTramModel]], line: String) {
        guard !availableBrigades.isEmpty else { return }
        guard let transportForLine = actives[line] else { return }
        transportToShow = ([], [])
        for brigade in availableBrigades {
            print(brigade)
            for active in transportForLine {
                if brigade.brygada == active.brigade {
                    transportToShow.0.append(active)
                    transportToShow.1.append(brigade.czas.trimTime())
                }
            }
        }
        print(transportToShow)
    }
}
