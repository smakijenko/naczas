//
//  PreferredRouteForLine.swift
//  naczas
//
//  Created by Stanisław Makijenko on 02/03/2025.
//

import Foundation

let preferredMainRouteForTrams: [String : [PreferredRouteModel]] = [
    "1" : [PreferredRouteModel(routeName: "TD-5NAR", direction: "pl.Narutowicza"), PreferredRouteModel(routeName: "TX-A04ZN", direction: "Annopol")],
    "2" : [PreferredRouteModel(routeName: "TX-11WIN", direction: "Winnica"), PreferredRouteModel(routeName: "TX-MML11", direction: "Metro Młociny")],
    "3" : [PreferredRouteModel(routeName: "TP-GCW", direction: "Gocławek"), PreferredRouteModel(routeName: "TP-ANN", direction: "Annopol")],
    "4" : [PreferredRouteModel(routeName: "Custom4Wyścigi", direction: "Wyścigi"), PreferredRouteModel(routeName: "Custom4ŻerańWschodni", direction: "Żerań Wschodni")],
    "6" : [PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny"), PreferredRouteModel(routeName: "TP-GCW", direction: "Gocławek")],
    "7" : [PreferredRouteModel(routeName: "Custom7KawęczyńskaBazylika", direction: "Kawęczyńska Bazylika"), PreferredRouteModel(routeName: "Custom7PlNarutowicza", direction: "pl.Narutowicza")],
    "9" : [PreferredRouteModel(routeName: "TP-GCW", direction: "Gocławek"), PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska")],
    "10" : [PreferredRouteModel(routeName: "TP-GOR", direction: "Os.Górczewska"), PreferredRouteModel(routeName: "TP-WYS", direction: "Wyścigi")],
    "11" : [PreferredRouteModel(routeName: "TX-SLC76", direction: "Sielce"), PreferredRouteModel(routeName: "TX-CMW06", direction: "Cm.Wolski")],
    "13" : [PreferredRouteModel(routeName: "TP-CMW", direction: "Cm.Wolski"), PreferredRouteModel(routeName: "TP-KAW", direction: "Kawęczyńska-Bazylika")],
    "14" : [PreferredRouteModel(routeName: "Custom14PlNarutowicza", direction: "pl.Narutowicza"), PreferredRouteModel(routeName: "Custom14MiasteczkoWilanow", direction: "Miasteczko Wilanów")],
    "15" : [PreferredRouteModel(routeName: "TP-MPT", direction: "Marymont-Potok"), PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska")],
    "16" : [PreferredRouteModel(routeName: "TP-MWL", direction: "Miasteczko Wilanów"), PreferredRouteModel(routeName: "Custom16Piaski", direction: "Piaski")],
    "17" : [PreferredRouteModel(routeName: "TP-WIN", direction: "Winnica"), PreferredRouteModel(routeName: "TP-SLU", direction: "PKP Służewiec")],
    "18" : [PreferredRouteModel(routeName: "TP-SLU", direction: "PKP Służewiec"), PreferredRouteModel(routeName: "TP-FSO", direction: "Żerań FSO")],
    "20" : [PreferredRouteModel(routeName: "TP-BOE", direction: "Boernerowo"), PreferredRouteModel(routeName: "TP-FSO", direction: "Żerań FSO")],
    "22" : [PreferredRouteModel(routeName: "TP-PIA", direction: "Piaski"), PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna")],
    "23" : [PreferredRouteModel(routeName: "TP-STA", direction: "Czynszowa"), PreferredRouteModel(routeName: "TP-NBM", direction: "Nowe Bemowo")],
    "24" : [PreferredRouteModel(routeName: "TP-NBM", direction: "Nowe Bemowo"), PreferredRouteModel(routeName: "TP-GCW", direction: "Gocławek")],
    "25" : [PreferredRouteModel(routeName: "Custom25PlNarutowicza", direction: "pl. Narutowicza"), PreferredRouteModel(routeName: "Custom25Annopol", direction: "Annopol")],
    "26" : [PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny")],
    "27" : [PreferredRouteModel(routeName: "TP-MRM", direction: "Metro Marymont"), PreferredRouteModel(routeName: "TP-CMW", direction: "Cm.Wolski")],
    "28" : [PreferredRouteModel(routeName: "TP-DWK", direction: "Dw.Wschodni (Kijowska)"), PreferredRouteModel(routeName: "TP-GOR", direction: "os.Górczewska")],
    "31" : [PreferredRouteModel(routeName: "TP-WIE71", direction: "Metro Wierzbno"), PreferredRouteModel(routeName: "TP-71SZW", direction: "PKP Służewiec")],
    "33" : [PreferredRouteModel(routeName: "TP-KIE", direction: "Kielecka"), PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny")],
]
