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
}
