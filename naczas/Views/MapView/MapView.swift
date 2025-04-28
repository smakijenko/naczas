//
//  MapView.swift
//  naczas
//
//  Created by Stanisław Makijenko on 12/02/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var btManager: ActiveBusTramManager
    @StateObject private var locationManager = LocationManager()
    @StateObject private var mapVm = MapViewModel()
    let departures: [LineDeparturesForStopModel]
    let selectedIndex: Int
    let stops: [DecodedStopInfoModel]
    let line: String
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            map
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        SheetDismissButtonView()
                            .padding(.top, 17)
                        busTramInfoButton
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            mapVm.setPosToSelectedStop(selectedStop: stops[selectedIndex])
            mapVm.fillIndexStopPairs(indexes: stops.count, selectedIndex: selectedIndex)
            do {
                try mapVm.provideAvailableBrigades(departures: departures)
            }
            catch {
                print("Alert: Could not provide brigades to show.")
                mapVm.showNoBrigadesAlert.toggle()
            }
        }
        .onChangeWithInitial(of: mapVm.elapsedTime) { _ in
            guard mapVm.elapsedTime % 10 == 0 else { return }
            Task {
                do {
                    try await mapVm.updateActiveBusesTrams(line: line, manager: btManager)
                    await MainActor.run {
                        if allTramsLines.contains(line) {
                            mapVm.provideTransportToShow(actives: btManager.activeTrams, line: line)
                        }
                        else {
                            mapVm.provideTransportToShow(actives: btManager.activeBuses, line: line)
                        }
                    }
                }
                catch {
                    mapVm.attemptsCouter += 1
                    print("Alert: Could not update active buses or trams.")
                    if mapVm.attemptsCouter == 6 {
                        mapVm.showManyFailedAttemptsFetchingActivesAlert.toggle()
                    }
                }
            }
        }
        .alert(isPresented: .constant(mapVm.showNoBrigadesAlert || mapVm.showManyFailedAttemptsFetchingActivesAlert)) {
            if mapVm.showNoBrigadesAlert {
                noBridgesAlert
            }
            else {
                noActivesAlert
            }
        }
    }
}

#Preview {
    MapView(departures: defaultDepartures, selectedIndex: 5, stops: defaultDecodedStops, line: "189")
        .environmentObject(ActiveBusTramManager())
}

extension MapView {
    private var map: some View {
        Map(position: $mapVm.mapPosition) {
            
            // BusTrams
            ForEach(0 ..< mapVm.transportToShow.0.count) { index in
                Annotation(mapVm.transportToShow.0[index].brigade, coordinate: CLLocationCoordinate2D(latitude: mapVm.transportToShow.0[index].lat, longitude: mapVm.transportToShow.0[index].lon), anchor: .bottom) {
                    VStack(spacing: 13) {
                        if mapVm.showBusTramInfo {
                            BusTramInfoAnnotation(time: mapVm.transportToShow.1[index], scale: 0.75)
                        }
                        BusTramAnnotation(isTram: allTramsLines.contains(line))
                    }
                }
            }
            
            // Stops
            ForEach(0 ..< stops.count) { index in
                if let lat = Double(stops[index].szerGeo), let lon = Double(stops[index].dluGeo) {
                    Annotation(stops[index].nazwaZespołu, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon), anchor: .bottom) {
                        StopAnnotation(isTram: allTramsLines.contains(line), isSelectedStop: mapVm.stopsSelectionStates[index] ?? false)
                    }
                }
            }
        }
    }
    
    private var busTramInfoButton: some View {
        Button {
            touchVibrates.impactOccurred()
            mapVm.showBusTramInfo.toggle()
        } label: {
            Image(systemName: mapVm.showBusTramInfo ? "eye.slash" : "eye")
                .font(.system(size: 25))
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .frame(width: 50, height: 40)
                .background(customThinTranslucentMaterial)
                .cornerRadius(10)
                .padding(.horizontal, 17)
        }
    }
    
    private var noActivesAlert: Alert {
        Alert(
            title: Text("Błąd!"),
            message: Text(mapVm.manyFailedAttempsAlertText),
            primaryButton: .default(Text("Wybór przystanku"), action: {
                dismiss()
            }),
            secondaryButton: .cancel(Text("Kontynuuj"))
        )
    }
    
    private var noBridgesAlert: Alert {
        Alert(
            title: Text("Błąd!"),
            message: Text(mapVm.noBrigadesToShowAlertText),
            dismissButton: .default(Text("Ok"))
        )
    }
}
