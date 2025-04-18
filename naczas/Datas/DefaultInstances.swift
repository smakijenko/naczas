//
//  DefaultInstances.swift
//  naczas
//
//  Created by Stanisław Makijenko on 23/02/2025.
//

import Foundation

let defaultRoute = RouteForLineModel(routeName: "Custom130MetroWilanowska", stops: [
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "0103", nrZespolu: "3079", typ: "1", nrPrzystanku: "04"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "2044", nrZespolu: "3080", typ: "2", nrPrzystanku: "04"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "2044", nrZespolu: "3091", typ: "2", nrPrzystanku: "02"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "0815", nrZespolu: "3090", typ: "1", nrPrzystanku: "02"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "0815", nrZespolu: "3089", typ: "1", nrPrzystanku: "02"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "0815", nrZespolu: "3062", typ: "1", nrPrzystanku: "02"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "Fort Piłsudskiego", nrZespolu: "Idzikowskiego", typ: "1", nrPrzystanku: "00"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "Idzikowskiego", nrZespolu: "Fort Piłsudskiego", typ: "2", nrPrzystanku: "00"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "Bukowińska", nrZespolu: "Płyćwiańska", typ: "2", nrPrzystanku: "00"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "1801", nrZespolu: "3008", typ: "1", nrPrzystanku: "01"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "1801", nrZespolu: "3009", typ: "1", nrPrzystanku: "01"),
    StopInRouteInfoModel(odleglosc: 0, ulicaID: "0125", nrZespolu: "3009", typ: "1", nrPrzystanku: "11"),
], stopsNum: 12)

let defaultDepartures = [
    LineDeparturesForStopModel(brygada: "018", kierunek: "Sadyba", trasa: "Td-1sad", czas: "04:14:00", line: "189"),
    LineDeparturesForStopModel(brygada: "6", kierunek: "Sadyba", trasa: "Td-1sad", czas: "04:29:00", line: "189"),
    LineDeparturesForStopModel(brygada: "020", kierunek: "Sadyba", trasa: "TD-1SAX", czas: "04:44:00", line: "189"),
    LineDeparturesForStopModel(brygada: "021", kierunek: "Sadyba", trasa: "TD-1SAX", czas: "04:59:00", line: "189"),
    LineDeparturesForStopModel(brygada: "11", kierunek: "Sadyba", trasa: "TX-SADG", czas: "05:09:00", line: "189"),
    LineDeparturesForStopModel(brygada: "024", kierunek: "Sadyba", trasa: "TX-SADG", czas: "05:24:00", line: "189"),
    LineDeparturesForStopModel(brygada: "15", kierunek: "Sadyba", trasa: "TX-SADG", czas: "05:32:00", line: "189"),
    LineDeparturesForStopModel(brygada: "025", kierunek: "Sadyba", trasa: "TO-SAD", czas: "05:39:00", line: "189"),
    LineDeparturesForStopModel(brygada: "026", kierunek: "Sadyba", trasa: "TO-SAD", czas: "05:47:00", line: "189"),
    LineDeparturesForStopModel(brygada: "1", kierunek: "Sadyba", trasa: "TO-SAD", czas: "05:53:00", line: "189"),
    LineDeparturesForStopModel(brygada: "027", kierunek: "Sadyba", trasa: "TX-SADG", czas: "05:59:00", line: "189"),
    LineDeparturesForStopModel(brygada: "2", kierunek: "Sadyba", trasa: "TX-SADG", czas: "06:05:00", line: "189"),
    LineDeparturesForStopModel(brygada: "028", kierunek: "Sadyba", trasa: "TO-SAD", czas: "06:12:00", line: "189"),
    LineDeparturesForStopModel(brygada: "017", kierunek: "Sadyba", trasa: "TO-SAD", czas: "06:17:00", line: "189"),
    LineDeparturesForStopModel(brygada: "3", kierunek: "Sadyba", trasa: "TX-SADG", czas: "06:23:00", line: "189"),
    LineDeparturesForStopModel(brygada: "4", kierunek: "Sadyba", trasa: "TX-SADG", czas: "06:28:00", line: "189"),
    LineDeparturesForStopModel(brygada: "018", kierunek: "Sadyba", trasa: "TO-SAD", czas: "06:33:00", line: "189"),
    LineDeparturesForStopModel(brygada: "5", kierunek: "Sadyba", trasa: "TO-SAD", czas: "06:38:00", line: "189"),
    LineDeparturesForStopModel(brygada: "6", kierunek: "Sadyba", trasa: "TO-SAD", czas: "06:43:00", line: "189"),
    LineDeparturesForStopModel(brygada: "7", kierunek: "Sadyba", trasa: "TX-SADG", czas: "06:49:00", line: "189"),
    LineDeparturesForStopModel(brygada: "019", kierunek: "Sadyba", trasa: "TO-SAD", czas: "06:54:00", line: "189"),
    LineDeparturesForStopModel(brygada: "16", kierunek: "Sadyba", trasa: "TO-SAD", czas: "11:15:00", line: "189"),
    LineDeparturesForStopModel(brygada: "1", kierunek: "Sadyba", trasa: "TO-SAD", czas: "11:25:00", line: "189"),
    LineDeparturesForStopModel(brygada: "2", kierunek: "Sadyba", trasa: "TO-SAD", czas: "11:35:00", line: "189"),
    LineDeparturesForStopModel(brygada: "3", kierunek: "Sadyba", trasa: "TO-SAD", czas: "11:45:00", line: "189"),
    LineDeparturesForStopModel(brygada: "4", kierunek: "Sadyba", trasa: "TO-SAD", czas: "11:55:00", line: "189"),
    LineDeparturesForStopModel(brygada: "5", kierunek: "Sadyba", trasa: "TO-SAD", czas: "12:05:00", line: "189"),
    LineDeparturesForStopModel(brygada: "6", kierunek: "Sadyba", trasa: "TO-SAD", czas: "12:15:00", line: "189"),
    LineDeparturesForStopModel(brygada: "7", kierunek: "Sadyba", trasa: "TO-SAD", czas: "12:25:00", line: "189"),
    LineDeparturesForStopModel(brygada: "8", kierunek: "Sadyba", trasa: "TO-SAD", czas: "12:35:00", line: "189"),
    LineDeparturesForStopModel(brygada: "9", kierunek: "Sadyba", trasa: "TO-SAD", czas: "12:45:00", line: "189"),
    LineDeparturesForStopModel(brygada: "10", kierunek: "Sadyba", trasa: "TO-SAD", czas: "12:55:00", line: "189"),
    LineDeparturesForStopModel(brygada: "11", kierunek: "Sadyba", trasa: "TO-SAD", czas: "13:05:00", line: "189")
]

