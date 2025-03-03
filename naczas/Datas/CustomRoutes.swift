//
//  CustomRoutes.swift
//  naczas
//
//  Created by Stanisław Makijenko on 03/03/2025.
//

import Foundation

let customRoutes: [LineRoutsEntity] = [
    LineRoutsEntity (lineName: "4", routes: [
        LineRouteModel(routeName: "Custom4Wyścigi", stops: [
            RouteStopInfoModel (odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "P", nrPrzystanku: "1"),
            
        ], stopsNum: 1),
        
        LineRouteModel(routeName: "Custom4ŻerańWschodni", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "p", nrPrzystanku: "1")
        ],stopsNum: 1),
    ]),
    
    LineRoutsEntity (lineName: "7", routes: [
        LineRouteModel(routeName: "Custom7KawęczyńskaBazylika", stops: [
            RouteStopInfoModel (odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "P", nrPrzystanku: "1"),
            
        ], stopsNum: 1),
        
        LineRouteModel(routeName: "Custom7PlNarutowicza", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "p", nrPrzystanku: "1")
        ],stopsNum: 1),
    ]),
    
    LineRoutsEntity (lineName: "14", routes: [
        LineRouteModel(routeName: "Custom14MiasteczkoWilanow", stops: [
            RouteStopInfoModel (odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "P", nrPrzystanku: "1"),
            
        ], stopsNum: 1),
        
        LineRouteModel(routeName: "Custom14PlNarutowicza", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "p", nrPrzystanku: "1")
        ],stopsNum: 1),
    ]),
    
    LineRoutsEntity (lineName: "16", routes: [
        LineRouteModel(routeName: "Custom16Piaski", stops: [
            RouteStopInfoModel (odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "P", nrPrzystanku: "1"),
            
        ], stopsNum: 1),
    ]),
    
    LineRoutsEntity (lineName: "25", routes: [
        LineRouteModel(routeName: "Custom25PlNarutowicza", stops: [
            RouteStopInfoModel (odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "P", nrPrzystanku: "1"),
            
        ], stopsNum: 1),
        
        LineRouteModel(routeName: "Custom25Annopol", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "1234567890", nrZespolu: "1", typ: "p", nrPrzystanku: "1")
        ],stopsNum: 1),
    ]),
]
