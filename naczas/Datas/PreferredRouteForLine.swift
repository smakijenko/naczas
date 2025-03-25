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
    "126" : [PreferredRouteModel(routeName: "TP-CHT-K", direction: "CH Targówek"), PreferredRouteModel(routeName: "TP-TAR-K", direction: "Tarchomin")],
    "127" : [PreferredRouteModel(routeName: "Custom127UrsusRatusz", direction: "Ursus Ratusz"), PreferredRouteModel(routeName: "Custom127Browarna", direction: "Browarna")],
    "128" : [PreferredRouteModel(routeName: "TP-SZC", direction: "Szczęśliwice"), PreferredRouteModel(routeName: "TP-PIL", direction: "Pl.Piłsudskiego")],
    "129" : [PreferredRouteModel(routeName: "TP-KOL", direction: "Koło"), PreferredRouteModel(routeName: "TP-PKU", direction: "PKP Ursus")],
    "130" : [PreferredRouteModel(routeName: "Custom130ECSiekierki", direction: "EC Siekierki"), PreferredRouteModel(routeName: "Custom130MetroWilanowska", direction: "Metro Wilanowska")],
    "131" : [PreferredRouteModel(routeName: "Custom131DwCentralny", direction: "Dw.Centralny"), PreferredRouteModel(routeName: "Custom131Sadyba", direction: "Sadyba")],
    "132" : [PreferredRouteModel(routeName: "TP-DER", direction: "Os.Derby"), PreferredRouteModel(routeName: "TP-MRM", direction: "Metro Marymont")],
    "133" : [PreferredRouteModel(routeName: "TP-TRC", direction: "Tarchomin"), PreferredRouteModel(routeName: "TP-CHS", direction: "Choszczówka")],
    "134" : [PreferredRouteModel(routeName: "TP-MRM-S", direction: "Metro Marymont"), PreferredRouteModel(routeName: "TX-OLE-S", direction: "Olesin")],
    "135" : [PreferredRouteModel(routeName: "TO-OLS", direction: "PKP Olszynka Grochowska"), PreferredRouteModel(routeName: "TP-HAL", direction: "pl.Hallera")],
    "136" : [PreferredRouteModel(routeName: "TP-NAT", direction: "Natolin Płn."), PreferredRouteModel(routeName: "TP-OST", direction: "Ostroroga")],
    "138" : [PreferredRouteModel(routeName: "TP-BOK", direction: "Natolin Płn."), PreferredRouteModel(routeName: "TP-UTS", direction: "Utrata")],
    "139" : [PreferredRouteModel(routeName: "Custom139OgródBotaniczny", direction: "Ogród Botaniczny"), PreferredRouteModel(routeName: "Custom139OsKabaty", direction: "Os.Kabaty")],
    "140" : [PreferredRouteModel(routeName: "TP-MTR", direction: "Metro Trocka"), PreferredRouteModel(routeName: "TP-CZS", direction: "Czarna Struga")],
    "141" : [PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska"), PreferredRouteModel(routeName: "TP-OST", direction: "Witolin")],
    "142" : [PreferredRouteModel(routeName: "TP-ALE", direction: "Aleksandrów"), PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna")],
    "143" : [PreferredRouteModel(routeName: "TP-PML", direction: "Pomnik Lotnika"), PreferredRouteModel(routeName: "TP-RKL", direction: "Rembertów-Kolonia")],
    "145" : [PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TP-FSO", direction: "Żerań FSO")],
    "146" : [PreferredRouteModel(routeName: "TP-DWL", direction: "Dw.Wschodni (Lubelska)"), PreferredRouteModel(routeName: "TP-FAL", direction: "Falenica")],
    "147" : [PreferredRouteModel(routeName: "TP-MIL", direction: "Stara Miłosna (Ułańska)"), PreferredRouteModel(routeName: "TP-DWL", direction: "Dw.Wschodni (Lubelska)")],
    "148" : [PreferredRouteModel(routeName: "TX-WIA", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TX-LOT", direction: "Terminal Autokarowy")],
    "149" : [PreferredRouteModel(routeName: "TX-GRO", direction: "Groty"), PreferredRouteModel(routeName: "TP-MBE", direction: "Metro Bemowo")],
    "150" : [PreferredRouteModel(routeName: "TP-DZI", direction: "Dziekanów Leśny"), PreferredRouteModel(routeName: "TX-MML03", direction: "Metro Młociny")],
    "151" : [PreferredRouteModel(routeName: "TP-REH", direction: "Rechniewskiego"), PreferredRouteModel(routeName: "TP-MPL", direction: "pl.Konstytucji")],
    "152" : [PreferredRouteModel(routeName: "TP-DER", direction: "os.Derby"), PreferredRouteModel(routeName: "TP-TRC", direction: "Tarchomin")],
    "153" : [PreferredRouteModel(routeName: "TP-PAS", direction: "Pastuszków"), PreferredRouteModel(routeName: "TP-RKL", direction: "Rembertów-Kolonia")],
    "154" : [PreferredRouteModel(routeName: "Custom154DwZachodni", direction: "Dw.Zachodni"), PreferredRouteModel(routeName: "Custom154PRAlKrakowska", direction: "P+R Al.Krakowska")],
    "156" : [PreferredRouteModel(routeName: "TX-DWK", direction: "Dw.Wschodni (Kijowska)"), PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny")],
    "157" : [PreferredRouteModel(routeName: "Custom157Gwiaździsta", direction: "Gwiaździsta"), PreferredRouteModel(routeName: "Custom157Szczęśliwice", direction: "Szczęśliwice")],
    "158" : [PreferredRouteModel(routeName: "TP-CHR", direction: "CH Reduta"), PreferredRouteModel(routeName: "TP-OST", direction: "Witolin")],
    "159" : [PreferredRouteModel(routeName: "TP-MSI", direction: "Małe Siekierki"), PreferredRouteModel(routeName: "TP-BLC", direction: "CH Blue City")],
    "160" : [PreferredRouteModel(routeName: "TP-DWCT", direction: "Dw.Centralny"), PreferredRouteModel(routeName: "TP-GROT", direction: "Grodzisk")],
    "161" : [PreferredRouteModel(routeName: "Custom161Olecka", direction: "Olecka"), PreferredRouteModel(routeName: "TP-ZBG", direction: "Zbójna Góra")],
    "162" : [PreferredRouteModel(routeName: "TP-HAL", direction: "pl.Hallera"), PreferredRouteModel(routeName: "TP-SIE", direction: "EC Siekierki")],
    "163" : [PreferredRouteModel(routeName: "Custom163CentrumOnkologii", direction: "Centrum Onkologii"), PreferredRouteModel(routeName: "Custom163MetroWilanowska", direction: "Metro Wilanowska")],
    "164" : [PreferredRouteModel(routeName: "Custom164KępaZawadowska", direction: "Kępa Zawadowska"), PreferredRouteModel(routeName: "Custom164MetroWilanowska", direction: "Metro Wilanowska")],
    "165" : [PreferredRouteModel(routeName: "TP-WIL", direction: "Metro Wilanowska"), PreferredRouteModel(routeName: "TP-WYC", direction: "Wyczółki")],
    "166" : [PreferredRouteModel(routeName: "TP-HAL", direction: "pl.Hallera"), PreferredRouteModel(routeName: "TP-MKA", direction: "Os.Kabaty")],
    "167" : [PreferredRouteModel(routeName: "Custom167StareBemowo", direction: "Stare Bemowo"), PreferredRouteModel(routeName: "Custom167SiekierkiSanktuarium", direction: "Siekierki-Sanktuarium")],
    "168" : [PreferredRouteModel(routeName: "TX-WIT", direction: "Witolin"), PreferredRouteModel(routeName: "TX-SPA", direction: "Spartańska")],
    "169" : [PreferredRouteModel(routeName: "TP-DWK", direction: "Dw.Wschodni (Kijowska)"), PreferredRouteModel(routeName: "TP-BRP", direction: "Bródno-Podgrodzie")],
    "170" : [PreferredRouteModel(routeName: "TP-ZAW", direction: "PKP Zacisze-Wilno"), PreferredRouteModel(routeName: "TP-RST", direction: "Rondo Starzyńskiego")],
    "171" : [PreferredRouteModel(routeName: "TP-CHO", direction: "Chomiczówka"), PreferredRouteModel(routeName: "TP-TOR", direction: "Torwar")],
    "172" : [PreferredRouteModel(routeName: "TX-BER", direction: "Berestecka"), PreferredRouteModel(routeName: "TP-SAD", direction: "Sadyba")],
    "173" : [PreferredRouteModel(routeName: "TP-DWL", direction: "Dw.Wschodni (Lubelska)"), PreferredRouteModel(routeName: "TP-SMG", direction: "Stara Miłosna (Graniczna)")],
    "174" : [PreferredRouteModel(routeName: "TP-RON", direction: "Rondo ONZ"), PreferredRouteModel(routeName: "TP-BOK", direction: "Bokserska")],
    "175" : [PreferredRouteModel(routeName: "TX-LOT", direction: "Terminal Autokarowy"), PreferredRouteModel(routeName: "TX-PILL", direction: "Pl.Piłsudskiego")],
    "176" : [PreferredRouteModel(routeName: "TP-MBR", direction: "Metro Bródno"), PreferredRouteModel(routeName: "TP-CHS", direction: "Choszczówka")],
    "177" : [PreferredRouteModel(routeName: "TP-URN", direction: "Ursus-Niedźwiadek"), PreferredRouteModel(routeName: "TP-GOR", direction: "Os.Górczewska")],
    "178" : [PreferredRouteModel(routeName: "TX-RDS", direction: "Rondo Daszyńskiego"), PreferredRouteModel(routeName: "TX-SKOD9", direction: "Skorosze")],
    "179" : [PreferredRouteModel(routeName: "TP-UPN", direction: "Ursynów Płn."), PreferredRouteModel(routeName: "TP-MKA", direction: "Os.Kabaty")],
    "180" : [PreferredRouteModel(routeName: "TP-WLW", direction: "Wilanów"), PreferredRouteModel(routeName: "TP-CHO", direction: "Chomiczówka")],
    "181" : [PreferredRouteModel(routeName: "TP-PLW", direction: "Pl.Wilsona"), PreferredRouteModel(routeName: "TP-CMP", direction: "Cm.Północny-Brama Gł.")],
    "182" : [PreferredRouteModel(routeName: "TP-DWZ", direction: "Dw.Zachodni"), PreferredRouteModel(routeName: "TP-WIT", direction: "Witolin")],
    "183" : [PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TP-ZIE", direction: "Zielona")],
    "184" : [PreferredRouteModel(routeName: "TP-SZC", direction: "Szczęśliwice"), PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny")],
    "185" : [PreferredRouteModel(routeName: "TO-USN", direction: "CH Ursynów"), PreferredRouteModel(routeName: "TO-GWI", direction: "Gwiaździsta")],
    "186" : [PreferredRouteModel(routeName: "TP-SZC", direction: "Szczęśliwice"), PreferredRouteModel(routeName: "TP-NWD", direction: "Nowodwory")],
    "187" : [PreferredRouteModel(routeName: "TO-URN", direction: "Ursus-Niedźwiadek"), PreferredRouteModel(routeName: "TO-CHE", direction: "Chełmska")],
    "188" : [PreferredRouteModel(routeName: "TX-LOT", direction: "Terminal Autokarowy"), PreferredRouteModel(routeName: "TX-GWS", direction: "PKP Gocławek")],
    "189" : [PreferredRouteModel(routeName: "TO-SAD", direction: "Sadyba"), PreferredRouteModel(routeName: "TO-GOR", direction: "Os.Górczewska")],
    "190" : [PreferredRouteModel(routeName: "TX-GOR", direction: "Os.Górczewska"), PreferredRouteModel(routeName: "TX-CHM-G", direction: "CH Marki")],
    "191" : [PreferredRouteModel(routeName: "Custom191Regulska", direction: "Regulska"), PreferredRouteModel(routeName: "Custom191BanachaSzpital", direction: "Banacha-Szpital")],
    "192" : [PreferredRouteModel(routeName: "Custom192Krasnowola", direction: "Krasnowola"), PreferredRouteModel(routeName: "Custom192OsKabaty", direction: "Os.Kabaty")],
    "193" : [PreferredRouteModel(routeName: "TP-UPN", direction: "Ursynów Płn."), PreferredRouteModel(routeName: "TP-BOK", direction: "Bokserska")],
    "194" : [PreferredRouteModel(routeName: "TX-CMW", direction: "Cm.Wolski"), PreferredRouteModel(routeName: "TP-GOL", direction: "PKP Gołąbki")],
    "196" : [PreferredRouteModel(routeName: "TX-RK-P2", direction: "Rembertów-Kolonia"), PreferredRouteModel(routeName: "TX-RK-L3", direction: "Rembertów-Kolonia")],
    "197" : [PreferredRouteModel(routeName: "Custom197Gwiaździsta", direction: "Gwiaździsta"), PreferredRouteModel(routeName: "Custom197CmWolski", direction: "Cm.Wolski")],
    "198" : [PreferredRouteModel(routeName: "TP-DWW-L", direction: "PKP Wesoła"), PreferredRouteModel(routeName: "TP-MIL-L", direction: "Stara Miłosna (Ułańska)")],
    "199" : [PreferredRouteModel(routeName: "TP-REM", direction: "Rembertów-Strzelnica"), PreferredRouteModel(routeName: "Custom199BródnoPodgrodzie", direction: "Bródno-Podgrodzie")],
    "201" : [PreferredRouteModel(routeName: "TP-JAN", direction: "Metro Księcia Janusza"), PreferredRouteModel(routeName: "TP-NBM", direction: "Nowe Bemowo")],
    "202" : [PreferredRouteModel(routeName: "TP-GWS", direction: "PKP Gocławek"), PreferredRouteModel(routeName: "TP-MSN", direction: "Metro Stadion Narodowy")],
    "203" : [PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny"), PreferredRouteModel(routeName: "TP-FWA", direction: "Fort Wawrzyszew")],
    "204" : [PreferredRouteModel(routeName: "TX-MBR", direction: "Metro Bródno"), PreferredRouteModel(routeName: "TP-GRO", direction: "Grodzisk")],
    "207" : [PreferredRouteModel(routeName: "Custom207Regulska", direction: "Regulska"), PreferredRouteModel(routeName: "Custom207UrsusRatusz", direction: "Ursus-Ratusz")],
    "208" : [PreferredRouteModel(routeName: "Custom208Szczęśliwice1", direction: "Szczęśliwice"), PreferredRouteModel(routeName: "Custom208Szczęśliwice2", direction: "Szczęśliwice")],
    "209" : [PreferredRouteModel(routeName: "TP-UPD", direction: "Ursynów Płd."), PreferredRouteModel(routeName: "TX-DAWV", direction: "Dawidy")],
    "210" : [PreferredRouteModel(routeName: "TP-TRU", direction: "Skibińskiego"), PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny")],
    "211" : [PreferredRouteModel(routeName: "TX-FSOF", direction: "Żerań FSO"), PreferredRouteModel(routeName: "TP-DWI", direction: "Dąbrówka Wiślana")],
    "212" : [PreferredRouteModel(routeName: "TP-CHT", direction: "CH Targówek"), PreferredRouteModel(routeName: "TP-HAL", direction: "Pl.Hallera")],
    "213" : [PreferredRouteModel(routeName: "TP-GOC", direction: "Gocław"), PreferredRouteModel(routeName: "TP-BLO", direction: "Błota")],
    "217" : [PreferredRouteModel(routeName: "TP-NAT", direction: "Natolin Płn."), PreferredRouteModel(routeName: "Custom217MetroWilanowska", direction: "Metro Wilanowska")],
    "218" : [PreferredRouteModel(routeName: "Custom218MetroWierzbno", direction: "Metro Wierzbno"), PreferredRouteModel(routeName: "Custom218NowyMokotów", direction: "Os.Nowy Mokotów")],
    "219" : [PreferredRouteModel(routeName: "TP-RDS", direction: "PKP Radość"), PreferredRouteModel(routeName: "TP-GOC", direction: "Gocław")],
    "220" : [PreferredRouteModel(routeName: "Custom220NoweBemowo", direction: "Nowe Bemowo"), PreferredRouteModel(routeName: "Custom220PRKrakowska", direction: "P+R Al.Krakowska")],
    "221" : [PreferredRouteModel(routeName: "TO-ELB", direction: "Elbląska"), PreferredRouteModel(routeName: "TO-DWR", direction: "Dw.Gdański(Rydygiera)")],
    "225" : [PreferredRouteModel(routeName: "TP-GOC", direction: "Gocław"), PreferredRouteModel(routeName: "TP-MOL", direction: "PKP Mokry Ług")],
    "226" : [PreferredRouteModel(routeName: "Custom226MetroBródno", direction: "Metro Bródno"), PreferredRouteModel(routeName: "Custom26OsZielonaDolina", direction: "Os.Zielona Dolina")],
    "228" : [PreferredRouteModel(routeName: "TX-SASWV", direction: "Sasanki"), PreferredRouteModel(routeName: "TP-URR", direction: "Ursus-Ratusz")],
    "234" : [PreferredRouteModel(routeName: "TO-AUG", direction: "Augustów"), PreferredRouteModel(routeName: "TO-MBR", direction: "Żerań Wschodni")],
    "239" : [PreferredRouteModel(routeName: "Custom239Kępa", direction: "Kępa Okrzewska-Cmentarz"), PreferredRouteModel(routeName: "Custom239OsKabaty", direction: "Os.Kabaty")],
    "240" : [PreferredRouteModel(routeName: "TP-MKO", direction: "Metro Kondratowicza"), PreferredRouteModel(routeName: "TP-MPU", direction: "Pustelnik")],
    "245" : [PreferredRouteModel(routeName: "TP-ZMA2", direction: "Maczka"), PreferredRouteModel(routeName: "TP-BRP2", direction: "Bródno-Podgrodzie")],
    "249" : [PreferredRouteModel(routeName: "TP-KOL", direction: "Koło"), PreferredRouteModel(routeName: "TP-GOR", direction: "Os.Górczewska")],
    "250" : [PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny"), PreferredRouteModel(routeName: "TP-LOZ", direction: "Dąbrowa Zachodnia")],
    "251" : [PreferredRouteModel(routeName: "Custom251MetroWilanowska", direction: "Metro Wilanowska"), PreferredRouteModel(routeName: "Custom251Papiernia", direction: "CH Stara Papiernia")],
    "256" : [PreferredRouteModel(routeName: "TP-ZSZ", direction: "Zaułek-Szkoła"), PreferredRouteModel(routeName: "TP-MKO", direction: "Metro Kondratowicza")],
    "262" : [PreferredRouteModel(routeName: "TP-MTR", direction: "Metro Trocka"), PreferredRouteModel(routeName: "TP-LEW", direction: "Lewinów")],
    "263" : [PreferredRouteModel(routeName: "Custom263Wilanów", direction: "Wilanów"), PreferredRouteModel(routeName: "Custom263Oczyszczalnia", direction: "Oczyszczalnia 'Południe'")],
    "303" : [PreferredRouteModel(routeName: "TP-CMP", direction: "Cm.Północny-Brama Gł."), PreferredRouteModel(routeName: "TP-PLW", direction: "Pl.Wilsona")],
    "305" : [PreferredRouteModel(routeName: "TP-STR", direction: "Strusia"), PreferredRouteModel(routeName: "TP-MIE", direction: "PKP Międzylesie")],
    "311" : [PreferredRouteModel(routeName: "TP-GOC", direction: "Gocław"), PreferredRouteModel(routeName: "TP-KMN", direction: "Kamionek")],
    "314" : [PreferredRouteModel(routeName: "TP-OLE", direction: "Olesin"), PreferredRouteModel(routeName: "TP-TRC", direction: "Tarchomin")],
    "317" : [PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska"), PreferredRouteModel(routeName: "TP-WLW", direction: "Wilanów")],
    "319" : [PreferredRouteModel(routeName: "TP-MIE", direction: "Międzylesie"), PreferredRouteModel(routeName: "TP-PIL", direction: "Pileckiego")],
    "320" : [PreferredRouteModel(routeName: "TP-FRA", direction: "Fort Radiowo"), PreferredRouteModel(routeName: "TP-GRO", direction: "Groty")],
    "326" : [PreferredRouteModel(routeName: "TP-MBO", direction: "Metro Bródno"), PreferredRouteModel(routeName: "TP-MMA", direction: "Metro Marymont")],
    "331" : [PreferredRouteModel(routeName: "TX-LOT", direction: "Terminal Autokarowy"), PreferredRouteModel(routeName: "TX-WIL-P", direction: "Metro Wilanowska")],
    "332" : [PreferredRouteModel(routeName: "TP-PDWJ", direction: "Podwójna"), PreferredRouteModel(routeName: "TP-JZSJ", direction: "Juranda ze Spychowa-Szkoła")],
    "338" : [PreferredRouteModel(routeName: "TP-UTS", direction: "Utrata"), PreferredRouteModel(routeName: "TP-HAL", direction: "Pl.Hallera")],
    "340" : [PreferredRouteModel(routeName: "TP-PUS", direction: "Pustelnik"), PreferredRouteModel(routeName: "TP-MTR", direction: "Metro Trocka")],
    "349" : [PreferredRouteModel(routeName: "TP-COP", direction: "Coopera-Przychodnia"), PreferredRouteModel(routeName: "TP-MBE", direction: "Metro Bemowo")],
    "356" : [PreferredRouteModel(routeName: "TP-TAR", direction: "Metro Trocka"), PreferredRouteModel(routeName: "TP-ZWI", direction: "PKP Zacisze-Wilno")],
    "401" : [PreferredRouteModel(routeName: "TP-URN", direction: "Ursus-Niedźwiadek"), PreferredRouteModel(routeName: "TP-UPD", direction: "Ursynów Płd.")],
    "402" : [PreferredRouteModel(routeName: "TP-WYN", direction: "Wynalazek"), PreferredRouteModel(routeName: "TP-MAR", direction: "Marysin")],
    "409" : [PreferredRouteModel(routeName: "Custom409CmPółnocny", direction: "Cm.Północny-Brama Zach."), PreferredRouteModel(routeName: "TP-BRP", direction: "Bródno-Podgrodzie")],
    "411" : [PreferredRouteModel(routeName: "TP-SMG4", direction: "Stara Miłosna (Graniczna)"), PreferredRouteModel(routeName: "Custom411MetroPolitechnika", direction: "Metro Politechnika")],
    "414" : [PreferredRouteModel(routeName: "TP-INT", direction: "Stara Miłosna (Graniczna)"), PreferredRouteModel(routeName: "TP-BRP", direction: "Bródno-Podgrodzie")],
    "500" : [PreferredRouteModel(routeName: "TP-BRP", direction: "Bródno-Podgrodzie"), PreferredRouteModel(routeName: "TP-RAD", direction: "Rondo \"Radosława\"")],
    "502" : [PreferredRouteModel(routeName: "TP-MPL5A", direction: "Metro Politechnika"), PreferredRouteModel(routeName: "TP-RAD", direction: "Rondo \"Radosława\"")],
    "503" : [PreferredRouteModel(routeName: "TP-KON", direction: "Konwiktorska"), PreferredRouteModel(routeName: "TP-NAT", direction: "Natolin Płn.")],
    "504" : [PreferredRouteModel(routeName: "TX-MKA4", direction: "Os.Kabaty"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "507" : [PreferredRouteModel(routeName: "TX-MKA4", direction: "Os.Kabaty"), PreferredRouteModel(routeName: "TP-GOC", direction: "Gocław")],
    "509" : [PreferredRouteModel(routeName: "TP-GOC", direction: "Gocław"), PreferredRouteModel(routeName: "TP-WIN", direction: "Winnica")],
    "511" : [PreferredRouteModel(routeName: "Custom511DąbrówkaWiślana", direction: "Dąbrówka Wiślana"), PreferredRouteModel(routeName: "Custom511MetroMłociny", direction: "Metro Młociny")],
    "512" : [PreferredRouteModel(routeName: "TP-GIL", direction: "Gilarska"), PreferredRouteModel(routeName: "TP-DWK", direction: "Dw.Wschodni (Kijowska)")],
    "514" : [PreferredRouteModel(routeName: "TX-MPLV", direction: "Gilarska"), PreferredRouteModel(routeName: "TX-GRZV", direction: "Wola Grzybowska")],
    "516" : [PreferredRouteModel(routeName: "TP-NWD", direction: "Nowodwory"), PreferredRouteModel(routeName: "TP-FSO", direction: "Żerań FSO")],
    "517" : [PreferredRouteModel(routeName: "Custom517PlTrzechKrzyzy", direction: "Pl.Trzech Krzyży"), PreferredRouteModel(routeName: "Custom517UrsusNiedzwiadek", direction: "Ursus-Niedźwiadek")],
    "518" : [PreferredRouteModel(routeName: "TP-NWDB", direction: "Nowodwory"), PreferredRouteModel(routeName: "TO-BIE", direction: "Bielańska")],
    "519" : [PreferredRouteModel(routeName: "Custom519Powsin", direction: "Powsin-Park Kultury"), PreferredRouteModel(routeName: "Custom519MetroWilanowska", direction: "Metro Wilanowska")],
    "520" : [PreferredRouteModel(routeName: "Custom520Marysin", direction: "Marysin"), PreferredRouteModel(routeName: "Custom520DwCentralny", direction: "Dw.Centralny")],
    "521" : [PreferredRouteModel(routeName: "Custom521Falenica", direction: "Falenica"), PreferredRouteModel(routeName: "Custom521DwCentralny", direction: "Dw.Centralny")],
    "523" : [PreferredRouteModel(routeName: "TP-BEM", direction: "Stare Bemowo"), PreferredRouteModel(routeName: "TP-OLS", direction: "Dw.Centralny")],
    "525" : [PreferredRouteModel(routeName: "TX-GRO1", direction: "Grodzisk"), PreferredRouteModel(routeName: "TP-MKO", direction: "Metro Kondratowicza")],
    "702" : [PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TP-ORL", direction: "Orla")],
    "703" : [PreferredRouteModel(routeName: "TP-KOS", direction: "Kosów"), PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska")],
    "704" : [PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TP-OKE", direction: "Halinów")],
    "705" : [PreferredRouteModel(routeName: "TP-MRM-N", direction: "Metro Marymont"), PreferredRouteModel(routeName: "TP-NZO", direction: "Opolska")],
    "706" : [PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska"), PreferredRouteModel(routeName: "TP-JAN", direction: "Pl.Szwedzki")],
    "707" : [PreferredRouteModel(routeName: "TP-PTA", direction: "Targowisko"), PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska")],
    "709" : [PreferredRouteModel(routeName: "TP-PIP", direction: "PKP Piaseczno"), PreferredRouteModel(routeName: "TP-WIL-P", direction: "Metro Wilanowska")],
    "710" : [PreferredRouteModel(routeName: "TP-KBA", direction: "Os.Kabaty"), PreferredRouteModel(routeName: "TP-PTA", direction: "Targowisko")],
    "711" : [PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska"), PreferredRouteModel(routeName: "TP-PRN", direction: "P+R Nadarzyn")],
    "712" : [PreferredRouteModel(routeName: "TO-MBE71", direction: "Metro Bemowo"), PreferredRouteModel(routeName: "TO-KLA1", direction: "Klaudyn")],
    "713" : [PreferredRouteModel(routeName: "TP-CMW", direction: "Cm.Wolski"), PreferredRouteModel(routeName: "TP-KOP", direction: "Agricoop")],
    "714" : [PreferredRouteModel(routeName: "Custom714MetroBemowo", direction: "Metro Bemowo"), PreferredRouteModel(routeName: "Custom714Klonowa", direction: "Klonowa")],
    "715" : [PreferredRouteModel(routeName: "TP-UPN", direction: "Ursynów Płn."), PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska")],
    "716" : [PreferredRouteModel(routeName: "TP-CMW", direction: "Cm.Wolski"), PreferredRouteModel(routeName: "TP-PIO", direction: "Ogińskiego")],
    "717" : [PreferredRouteModel(routeName: "TP-DWZ", direction: "Dw.Zachodni"), PreferredRouteModel(routeName: "TP-PIO", direction: "Ogińskiego")],
    "719" : [PreferredRouteModel(routeName: "Custom719MetroBemowo", direction: "Metro Bemowo"), PreferredRouteModel(routeName: "TP-LES", direction: "Leszno")],
    "720" : [PreferredRouteModel(routeName: "Custom720Rzakta", direction: "Rzakta"), PreferredRouteModel(routeName: "Custom720Wiatraczna", direction: "Wiatraczna")],
    "721" : [PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska"), PreferredRouteModel(routeName: "TP-KOS", direction: "Kosów")],
    "722" : [PreferredRouteModel(routeName: "TP-WIA-Z", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TP-RAD-Z", direction: "Os.Radiówek")],
    "723" : [PreferredRouteModel(routeName: "TP-FSOP", direction: "Żerań FSO"), PreferredRouteModel(routeName: "TP-PLP", direction: "PKP Legionowo Przystanek")],
    "727" : [PreferredRouteModel(routeName: "Custom727MetroWilanowska", direction: "Metro Wilanowska"), PreferredRouteModel(routeName: "Custom727Władysławów", direction: "Władysławów")],
    "728" : [PreferredRouteModel(routeName: "TP-ZLO", direction: "Złotokłos"), PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska")],
    "729" : [PreferredRouteModel(routeName: "Custom729MetroBemowo", direction: "Metro Bemowo"), PreferredRouteModel(routeName: "Custom729Mariew", direction: "Mariew")],
    "730" : [PreferredRouteModel(routeName: "TP-WIA", direction: "Wiatraczna"), PreferredRouteModel(routeName: "TP-BRZ", direction: "Brzeziny")],
    "731" : [PreferredRouteModel(routeName: "TP-FSO", direction: "Żerań FSO"), PreferredRouteModel(routeName: "TP-LOM", direction: "Os.Młodych")],
    "733" : [PreferredRouteModel(routeName: "TP-MLW", direction: "Młochów"), PreferredRouteModel(routeName: "Custom733PRKrakowska", direction: "P+R Al.Krakowska")],
    "735" : [PreferredRouteModel(routeName: "TP-MRM", direction: "Metro Marymont"), PreferredRouteModel(routeName: "TP-ZEG", direction: "Zegrze Płd.")],
    "736" : [PreferredRouteModel(routeName: "TP-FSO", direction: "Żerań FSO"), PreferredRouteModel(routeName: "TP-LEM", direction: "Mickiewicza")],
    "737" : [PreferredRouteModel(routeName: "TP-UPN", direction: "Ursynów Płn."), PreferredRouteModel(routeName: "TP-ANT", direction: "Cm.Południowy-Brama Płd.")],
    "738" : [PreferredRouteModel(routeName: "TP-RAD", direction: "P+R Radzymin"), PreferredRouteModel(routeName: "TP-MET", direction: "Metro Trocka")],
    "739" : [PreferredRouteModel(routeName: "TP-WIL", direction: "Metro Wilanowska"), PreferredRouteModel(routeName: "TP-JUC", direction: "Julianowska-Cmentarz")],
    "742" : [PreferredRouteModel(routeName: "Custom742Rynek", direction: "Rynek"), PreferredRouteModel(routeName: "Custom742OsKabaty", direction: "Ursynów Płd.")],
    "743" : [PreferredRouteModel(routeName: "Custom743Gorczewska", direction: "Os.Górczewska"), PreferredRouteModel(routeName: "Custom743Wolica", direction: "Wolica k.Plochocina")],
    "750" : [PreferredRouteModel(routeName: "Custom750Dębina", direction: "Dębina"), PreferredRouteModel(routeName: "Custom750MetroMłociny", direction: "Metro Młociny")],
    "809" : [PreferredRouteModel(routeName: "TP-KAR", direction: "PKP Jeziorki"), PreferredRouteModel(routeName: "TP-UPD", direction: "Ursynów Płd.")],
    "815" : [PreferredRouteModel(routeName: "TP-PDN", direction: "Podolszyn"), PreferredRouteModel(routeName: "TP-UPD", direction: "Ursynów Płd.")],
    "817" : [PreferredRouteModel(routeName: "TX-DWZ", direction: "Dw.Zachodni"), PreferredRouteModel(routeName: "TP-PRU", direction: "Os.Staszica/Pętla")],
    "850" : [PreferredRouteModel(routeName: "TP-MSL", direction: "Metro Słodowiec"), PreferredRouteModel(routeName: "TP-CYB", direction: "Cybulice Duże")],
    "900" : [PreferredRouteModel(routeName: "Custom900Winnica", direction: "Winnica"), PreferredRouteModel(routeName: "Custom900Chlubna", direction: "Chlubna")],
    "N01" : [PreferredRouteModel(routeName: "CustomN01Nowodwory", direction: "Nowodwory"), PreferredRouteModel(routeName: "TP-UPN", direction: "Ursynów Płn.")],
    "N02" : [PreferredRouteModel(routeName: "TP-MAR", direction: "Marysin"), PreferredRouteModel(routeName: "TP-MML", direction: "Metro Młociny")],
    "N03" : [PreferredRouteModel(routeName: "TO-WIN-S", direction: "Winnica"), PreferredRouteModel(routeName: "TO-UPN", direction: "Ursynów Płn.")],
    "N11" : [PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny"), PreferredRouteModel(routeName: "TP-DER", direction: "Os.Derby")],
    "N12" : [PreferredRouteModel(routeName: "TP-MTR", direction: "Metro Trocka"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N13" : [PreferredRouteModel(routeName: "TP-NWD", direction: "Nowodwory"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N14" : [PreferredRouteModel(routeName: "TP-OLE", direction: "Olesin"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N16" : [PreferredRouteModel(routeName: "TP-ZAW", direction: "PKP Zacisze-Wilno"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N21" : [PreferredRouteModel(routeName: "TP-MIL", direction: "Stara Miłosna (Ułańska)"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N22" : [PreferredRouteModel(routeName: "TP-ALE", direction: "Aleksandrów"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N24" : [PreferredRouteModel(routeName: "TP-ALE", direction: "Aleksandrów"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N25" : [PreferredRouteModel(routeName: "TP-MIE", direction: "Międzylesie"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N31" : [PreferredRouteModel(routeName: "TP-WLW", direction: "Sadyba"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N32" : [PreferredRouteModel(routeName: "TP-CEN", direction: "Centrum"), PreferredRouteModel(routeName: "TP-LOT", direction: "Lotnisko Chopina")],
    "N33" : [PreferredRouteModel(routeName: "TX-ZWO", direction: "Zajezdnia Woronicza"), PreferredRouteModel(routeName: "TO-DWC", direction: "Dw.Centralny")],
    "N34" : [PreferredRouteModel(routeName: "TP-MKA", direction: "Os.Kabaty"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N35" : [PreferredRouteModel(routeName: "TP-URN", direction: "Ursus-Niedźwiadek"), PreferredRouteModel(routeName: "TP-CEN", direction: "Centrum")],
    "N36" : [PreferredRouteModel(routeName: "TP-BOK", direction: "Bokserska"), PreferredRouteModel(routeName: "TP-DWC2", direction: "Dw.Centralny")],
    "N37" : [PreferredRouteModel(routeName: "TP-MKA", direction: "Os.Kabaty"), PreferredRouteModel(routeName: "TP-DWC16", direction: "Dw.Centralny")],
    "N38" : [PreferredRouteModel(routeName: "TP-CEN", direction: "Centrum"), PreferredRouteModel(routeName: "TP-OKE", direction: "P+R Al.Krakowska")],
    "N41" : [PreferredRouteModel(routeName: "TP-MLO", direction: "Młociny-UKSW"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],
    "N42" : [PreferredRouteModel(routeName: "TP-GOR", direction: "Os.Górczewska"), PreferredRouteModel(routeName: "TP-DWC76", direction: "Dw.Centralny")],
    "N43" : [PreferredRouteModel(routeName: "CustomN43Chomiczówka", direction: "Chomiczówka"), PreferredRouteModel(routeName: "CustomN43DwCentralny", direction: "Dw.Centralny")],
    "N44" : [PreferredRouteModel(routeName: "TP-ZAZ", direction: "Zajezdnia Żoliborz"), PreferredRouteModel(routeName: "TP-DWC", direction: "Dw.Centralny")],

]
