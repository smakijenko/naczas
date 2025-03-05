//
//  PreferredRouteForLine.swift
//  naczas
//
//  Created by Stanisław Makijenko on 02/03/2025.
//

import Foundation

let preferredMainRoute: [String : [PreferredRouteModel]] = [
    "1" : [PreferredRouteModel(routeName: "TD-5NAR", direction: "pl.Narutowicza"), PreferredRouteModel(routeName: "TX-A04ZN", direction: "Annopol")],
    "2" : [PreferredRouteModel(routeName: "TX-11WIN", direction: "Winnica"), PreferredRouteModel(routeName: "TX-MML11", direction: "Metro Młociny")],
    "3" : [PreferredRouteModel(routeName: "TP-GCW", direction: "Gocławek"), PreferredRouteModel(routeName: "TP-ANN", direction: "Annopol")],
    "4" : [PreferredRouteModel(routeName: "TP-WYS", direction: "Wyścigi"), PreferredRouteModel(routeName: "TP-ZEW", direction: "Żerań Wschodni")],
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
    "25" : [PreferredRouteModel(routeName: "Custom25PlNarutowicza", direction: "pl.Narutowicza"), PreferredRouteModel(routeName: "Custom25Annopol", direction: "Annopol")],
    "26" : [PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny")],
    "27" : [PreferredRouteModel(routeName: "TP-MRM", direction: "Metro Marymont"), PreferredRouteModel(routeName: "TP-CMW", direction: "Cm.Wolski")],
    "28" : [PreferredRouteModel(routeName: "TP-DWK", direction: "Dw.Wschodni (Kijowska)"), PreferredRouteModel(routeName: "TP-GOR", direction: "os.Górczewska")],
    "31" : [PreferredRouteModel(routeName: "TP-WIE71", direction: "Metro Wierzbno"), PreferredRouteModel(routeName: "TP-71SZW", direction: "PKP Służewiec")],
    "33" : [PreferredRouteModel(routeName: "TP-KIE", direction: "Kielecka"), PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny")],
    "102" : [PreferredRouteModel(routeName: "TX-OLSV", direction: "PKP Olszynka Grochowska"), PreferredRouteModel(routeName: "TP-MSN", direction: "Metro Stadion Narodowy")],
    "103" : [PreferredRouteModel(routeName: "Custom103MetroMłociny", direction: "Metro Młociny"), PreferredRouteModel(routeName: "Custom103DwZachodni", direction: "Dw.Zachodni")],
    "104" : [PreferredRouteModel(routeName: "TP-BRZ", direction: "Brzeziny"), PreferredRouteModel(routeName: "TP-MBR", direction: "Metro Bródno")],
    "105" : [PreferredRouteModel(routeName: "Custom105RondoDaszyńskiego", direction: "Rondo Daszyńskiego"), PreferredRouteModel(routeName: "Custom105OsGórczewska", direction: "os.Górczewska")],
    "106" : [PreferredRouteModel(routeName: "TP-OST", direction: "Ostroroga"), PreferredRouteModel(routeName: "TP-MAT", direction: "Mariensztat")],
    "107" : [PreferredRouteModel(routeName: "Custom107Esperanto", direction: "Esperanto"), PreferredRouteModel(routeName: "Custom107MetroWilanowska", direction: "Metro Wilanowska")],
    "108" : [PreferredRouteModel(routeName: "TO-LOS", direction: "Łososiowa"), PreferredRouteModel(routeName: "TP-PTK", direction: "pl.Trzech Krzyży")],
    "110" : [PreferredRouteModel(routeName: "TX-MRM-M", direction: "Metro Marymont"), PreferredRouteModel(routeName: "TO-CHL", direction: "CH Łomianki")],
    "111" : [PreferredRouteModel(routeName: "TP-ESP", direction: "Esperanto"), PreferredRouteModel(routeName: "TP-GOC", direction: "Gocław")],
    "112" : [PreferredRouteModel(routeName: "TP-NBM", direction: "Nowe Bemowo"), PreferredRouteModel(routeName: "TP-CHM-K", direction: "CH Marki")],
    "114" : [PreferredRouteModel(routeName: "TP-BRP", direction: "Bródno-Podgrodzie"), PreferredRouteModel(routeName: "TP-UXW", direction: "Młociny-UKSW")],
    "115" : [PreferredRouteModel(routeName: "TP-MOL-Y", direction: "PKP Mokry Ług"), PreferredRouteModel(routeName: "TP-ALE-Y", direction: "Aleksandrów")],
    "116" : [PreferredRouteModel(routeName: "TP-CHO", direction: "Chomiczówka"), PreferredRouteModel(routeName: "TX-WLW4", direction: "Wilanów")],
    "117" : [PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny"), PreferredRouteModel(routeName: "TP-GOC", direction: "Gocław")],
    "118" : [PreferredRouteModel(routeName: "Custom118Mariensztat", direction: "Mariensztat"), PreferredRouteModel(routeName: "Custom118Spartańska", direction: "Spartańska")],
    "119" : [PreferredRouteModel(routeName: "TX-RAKV", direction: "Rakowiecka-Sanktuarium"), PreferredRouteModel(routeName: "TX-WIGV", direction: "Wiśniowa Góra")],
    "120" : [PreferredRouteModel(routeName: "Custom120Olesin", direction: "Olesin"), PreferredRouteModel(routeName: "Custom120DwWschodni", direction: "Dw.Wschodni (Kijowska)")],
    "121" : [PreferredRouteModel(routeName: "TX-MRMHV", direction: "Metro Marymont"), PreferredRouteModel(routeName: "TP-CHO-M", direction: "Chomiczówka")],
    "122" : [PreferredRouteModel(routeName: "TX-GOR03", direction: "os.Górczewska"), PreferredRouteModel(routeName: "TX-GWI02", direction: "Gwiaździsta")],
    "123" : [PreferredRouteModel(routeName: "TP-DWL", direction: "Dw.Wschodni (Lubelska)"), PreferredRouteModel(routeName: "TP-DWK", direction: "Dw.Wschodni (Kijowska)")],
    "124" : [PreferredRouteModel(routeName: "TX-OKE17", direction: "P+R Al.Krakowska"), PreferredRouteModel(routeName: "TP-PAL", direction: "Paluch")],
    "125" : [PreferredRouteModel(routeName: "TP-MIE", direction: "Międzylesie"), PreferredRouteModel(routeName: "TP-MSN", direction: "Metro Stadion Narodowy")],
]
