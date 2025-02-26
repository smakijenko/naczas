//
//  DefaultInstances.swift
//  naczas
//
//  Created by Stanisław Makijenko on 23/02/2025.
//

import Foundation

let defaultRoute = LineRouteModel (
    routeName: "TZ-SAD70",
    stops: [
        RouteStopInfoModel(odleglosc: 0, ulicaID: "1859", nrZespolu: "3065", typ: "3", nrPrzystanku: "03"),
        RouteStopInfoModel(odleglosc: 6882, ulicaID: "2513", nrZespolu: "R-07", typ: "6", nrPrzystanku: "99")
    ],
    stopsNum: 2
)
