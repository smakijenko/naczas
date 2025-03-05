//
//  CustomRoutes.swift
//  naczas
//
//  Created by Stanisław Makijenko on 03/03/2025.
//

import Foundation

let customRoutes: [String : [LineRouteModel]] = [
    "7" : [
        LineRouteModel(routeName: "Custom7KawęczyńskaBazylika", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "0005", nrZespolu: "4003", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 484, ulicaID: "0801", nrZespolu: "4002", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 892, ulicaID: "0101", nrZespolu: "4001", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 1231, ulicaID: "0101", nrZespolu: "4052", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 1858, ulicaID: "0101", nrZespolu: "7002", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 2387, ulicaID: "0101", nrZespolu: "7013", typ: "1", nrPrzystanku: "09"),
            RouteStopInfoModel(odleglosc: 2730, ulicaID: "0101", nrZespolu: "7033", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 3035, ulicaID: "0101", nrZespolu: "7041", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 4281, ulicaID: "1536", nrZespolu: "7003", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 5257, ulicaID: "0117", nrZespolu: "2131", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 5437, ulicaID: "0127", nrZespolu: "2131", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 6494, ulicaID: "2201", nrZespolu: "2001", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 6844, ulicaID: "1203", nrZespolu: "1001", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 7415, ulicaID: "1203", nrZespolu: "1028", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 7914, ulicaID: "0124", nrZespolu: "1029", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 8012, ulicaID: "1202", nrZespolu: "1030", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 8461, ulicaID: "1202", nrZespolu: "1031", typ: "3", nrPrzystanku: "02")
        ], stopsNum: 17),
        
        LineRouteModel(routeName: "Custom7PlNarutowicza", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "1202", nrZespolu: "1031", typ: "3", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 151, ulicaID: "1202", nrZespolu: "1031", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 389, ulicaID: "1202", nrZespolu: "1030", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 617, ulicaID: "1202", nrZespolu: "1029", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 1235, ulicaID: "1203", nrZespolu: "1028", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 1958, ulicaID: "2201", nrZespolu: "1001", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 2327, ulicaID: "0127", nrZespolu: "2001", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 3223, ulicaID: "0127", nrZespolu: "2131", typ: "1", nrPrzystanku: "09"),
            RouteStopInfoModel(odleglosc: 3399, ulicaID: "0117", nrZespolu: "2131", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 4379, ulicaID: "1536", nrZespolu: "7003", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 5452, ulicaID: "0101", nrZespolu: "7041", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 5794, ulicaID: "0101", nrZespolu: "7033", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 6122, ulicaID: "0101", nrZespolu: "7013", typ: "1", nrPrzystanku: "10"),
            RouteStopInfoModel(odleglosc: 6828, ulicaID: "0101", nrZespolu: "7002", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 7284, ulicaID: "0101", nrZespolu: "4052", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 7764, ulicaID: "0101", nrZespolu: "4001", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 8094, ulicaID: "0801", nrZespolu: "4002", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 8577, ulicaID: "0005", nrZespolu: "4003", typ: "1", nrPrzystanku: "08")
        ],stopsNum: 18)
    ],
    "14" : [
        LineRouteModel(routeName: "Custom14MiasteczkoWilanow", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "0005", nrZespolu: "4003", typ: "1", nrPrzystanku: "09"),
            RouteStopInfoModel(odleglosc: 328, ulicaID: "0701", nrZespolu: "4028", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 1023, ulicaID: "0701", nrZespolu: "4153", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 1484, ulicaID: "1602", nrZespolu: "7090", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 1982, ulicaID: "1602", nrZespolu: "7005", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 2230, ulicaID: "1602", nrZespolu: "7006", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 2692, ulicaID: "1503", nrZespolu: "7080", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 3087, ulicaID: "1503", nrZespolu: "3001", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 3572, ulicaID: "0819", nrZespolu: "3480", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 4557, ulicaID: "0205", nrZespolu: "3026", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 5010, ulicaID: "2015", nrZespolu: "3027", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 5699, ulicaID: "2015", nrZespolu: "3028", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 6300, ulicaID: "2015", nrZespolu: "3491", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 6840, ulicaID: "2015", nrZespolu: "3031", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 7199, ulicaID: "2015", nrZespolu: "3032", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 7795, ulicaID: "2015", nrZespolu: "3033", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 8501, ulicaID: "2015", nrZespolu: "3035", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 9210, ulicaID: "2015", nrZespolu: "3042", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 9796, ulicaID: "0150", nrZespolu: "3353", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 10462, ulicaID: "0150", nrZespolu: "3354", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 10782, ulicaID: "0150", nrZespolu: "3385", typ: "3", nrPrzystanku: "06")
        ], stopsNum: 21),
        
        LineRouteModel(routeName: "Custom14PlNarutowicza", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "0150", nrZespolu: "3385", typ: "3", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 483, ulicaID: "0150", nrZespolu: "3354", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 885, ulicaID: "0150", nrZespolu: "3353", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 1605, ulicaID: "2015", nrZespolu: "3042", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 2316, ulicaID: "2015", nrZespolu: "3035", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 3174, ulicaID: "2015", nrZespolu: "3033", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 3618, ulicaID: "2015", nrZespolu: "3032", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 3977, ulicaID: "2015", nrZespolu: "3031", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 4514, ulicaID: "2015", nrZespolu: "3491", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 5118, ulicaID: "2015", nrZespolu: "3028", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 5663, ulicaID: "2015", nrZespolu: "3027", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 6454, ulicaID: "2010", nrZespolu: "3026", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 7373, ulicaID: "1801", nrZespolu: "3480", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 7720, ulicaID: "1503", nrZespolu: "3001", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 8293, ulicaID: "1503", nrZespolu: "7010", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 8473, ulicaID: "1602", nrZespolu: "7006", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 8816, ulicaID: "1602", nrZespolu: "7005", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 9196, ulicaID: "1602", nrZespolu: "7090", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 9768, ulicaID: "0701", nrZespolu: "4153", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 10317, ulicaID: "0701", nrZespolu: "4028", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 10830, ulicaID: "0005", nrZespolu: "4003", typ: "1", nrPrzystanku: "08")
        ],stopsNum: 21)
    ],
    "16" : [
        LineRouteModel(routeName: "Custom16Piaski", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "0150", nrZespolu: "3385", typ: "3", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 518, ulicaID: "0150", nrZespolu: "3354", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 920, ulicaID: "0150", nrZespolu: "3353", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 1640, ulicaID: "2015", nrZespolu: "3042", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 2351, ulicaID: "2015", nrZespolu: "3035", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 3209, ulicaID: "2015", nrZespolu: "3033", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 3653, ulicaID: "2015", nrZespolu: "3032", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 4012, ulicaID: "2015", nrZespolu: "3031", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 4549, ulicaID: "2015", nrZespolu: "3491", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 5153, ulicaID: "2015", nrZespolu: "3028", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 5698, ulicaID: "2015", nrZespolu: "3027", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 6489, ulicaID: "2010", nrZespolu: "3026", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 7408, ulicaID: "1801", nrZespolu: "3480", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 7755, ulicaID: "1503", nrZespolu: "3001", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 8328, ulicaID: "1503", nrZespolu: "7010", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 8738, ulicaID: "0003", nrZespolu: "7011", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 9099, ulicaID: "1503", nrZespolu: "7012", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 9524, ulicaID: "1503", nrZespolu: "7013", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 10168, ulicaID: "1503", nrZespolu: "7014", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 10681, ulicaID: "1503", nrZespolu: "7015", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 11199, ulicaID: "0002", nrZespolu: "7016", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 11447, ulicaID: "0132", nrZespolu: "7099", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 11909, ulicaID: "0132", nrZespolu: "7017", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 12386, ulicaID: "0132", nrZespolu: "7018", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 12956, ulicaID: "2036", nrZespolu: "7020", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 13724, ulicaID: "0110", nrZespolu: "7091", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 13936, ulicaID: "0110", nrZespolu: "7091", typ: "1", nrPrzystanku: "10"),
            RouteStopInfoModel(odleglosc: 14801, ulicaID: "0213", nrZespolu: "6039", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 15222, ulicaID: "0213", nrZespolu: "6040", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 15944, ulicaID: "0213", nrZespolu: "6041", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 16303, ulicaID: "0213", nrZespolu: "6042", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 16688, ulicaID: "0213", nrZespolu: "6043", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 17237, ulicaID: "0213", nrZespolu: "6045", typ: "4", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 17541, ulicaID: "0213", nrZespolu: "6045", typ: "5", nrPrzystanku: "06")
        ], stopsNum: 34)
    ],
    "25" : [
        LineRouteModel(routeName: "Custom25PlNarutowicza", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "0104", nrZespolu: "1087", typ: "3", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 323, ulicaID: "1901", nrZespolu: "1086", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 643, ulicaID: "1901", nrZespolu: "1085", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 1074, ulicaID: "1901", nrZespolu: "1084", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 1290, ulicaID: "1901", nrZespolu: "1083", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 1752, ulicaID: "1901", nrZespolu: "1082", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 2509, ulicaID: "1567", nrZespolu: "1080", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 2822, ulicaID: "1701", nrZespolu: "1079", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 3453, ulicaID: "1701", nrZespolu: "1078", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 4058, ulicaID: "1701", nrZespolu: "1077", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 4688, ulicaID: "1301", nrZespolu: "1071", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 5461, ulicaID: "1301", nrZespolu: "1066", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 5960, ulicaID: "2201", nrZespolu: "1003", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 6281, ulicaID: "2201", nrZespolu: "1002", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 6773, ulicaID: "2201", nrZespolu: "1001", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 7142, ulicaID: "0127", nrZespolu: "2001", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 8038, ulicaID: "0127", nrZespolu: "2131", typ: "1", nrPrzystanku: "09"),
            RouteStopInfoModel(odleglosc: 8214, ulicaID: "0117", nrZespolu: "2131", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 9194, ulicaID: "1536", nrZespolu: "7003", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 10267, ulicaID: "0101", nrZespolu: "7041", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 10609, ulicaID: "0101", nrZespolu: "7033", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 10937, ulicaID: "0101", nrZespolu: "7013", typ: "1", nrPrzystanku: "10"),
            RouteStopInfoModel(odleglosc: 11643, ulicaID: "0101", nrZespolu: "7002", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 12099, ulicaID: "0101", nrZespolu: "4052", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 12579, ulicaID: "0101", nrZespolu: "4001", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 12909, ulicaID: "0801", nrZespolu: "4002", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 13392, ulicaID: "0005", nrZespolu: "4003", typ: "1", nrPrzystanku: "08"),
        ], stopsNum: 27),
        
        LineRouteModel(routeName: "Custom25Annopol", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "0005", nrZespolu: "4003", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 484, ulicaID: "0801", nrZespolu: "4002", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 892, ulicaID: "0101", nrZespolu: "4001", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 1231, ulicaID: "0101", nrZespolu: "4052", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 1858, ulicaID: "0101", nrZespolu: "7002", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 2387, ulicaID: "0101", nrZespolu: "7013", typ: "1", nrPrzystanku: "09"),
            RouteStopInfoModel(odleglosc: 2730, ulicaID: "0101", nrZespolu: "7033", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 3035, ulicaID: "0101", nrZespolu: "7041", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 4281, ulicaID: "1536", nrZespolu: "7003", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 5257, ulicaID: "0117", nrZespolu: "2131", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 5437, ulicaID: "0127", nrZespolu: "2131", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 6494, ulicaID: "2201", nrZespolu: "2001", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 6863, ulicaID: "2201", nrZespolu: "1001", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 7203, ulicaID: "2201", nrZespolu: "1002", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 7680, ulicaID: "2201", nrZespolu: "1003", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 8021, ulicaID: "1301", nrZespolu: "1066", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 8771, ulicaID: "1301", nrZespolu: "1071", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 9432, ulicaID: "1701", nrZespolu: "1077", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 10033, ulicaID: "1701", nrZespolu: "1078", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 10564, ulicaID: "1701", nrZespolu: "1079", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 10964, ulicaID: "1567", nrZespolu: "1080", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 11649, ulicaID: "1901", nrZespolu: "1082", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 11992, ulicaID: "1901", nrZespolu: "1083", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 12114, ulicaID: "1901", nrZespolu: "1084", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 12611, ulicaID: "1901", nrZespolu: "1085", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 13060, ulicaID: "1901", nrZespolu: "1086", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 13516, ulicaID: "0104", nrZespolu: "1087", typ: "3", nrPrzystanku: "04")
        ],stopsNum: 27)
    ],
    "103" : [
        LineRouteModel(routeName: "Custom103MetroMłociny", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "Tunelowa", nrZespolu: "DwZachodni", typ: "1", nrPrzystanku: "00"),
            RouteStopInfoModel(odleglosc: 400, ulicaID: "1213", nrZespolu: "5120", typ: "1", nrPrzystanku: "53"),
            RouteStopInfoModel(odleglosc: 697, ulicaID: "2834", nrZespolu: "5119", typ: "3", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 2403, ulicaID: "1204", nrZespolu: "5042", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 2938, ulicaID: "1809", nrZespolu: "5005", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 3513, ulicaID: "1809", nrZespolu: "5026", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 3843, ulicaID: "1809", nrZespolu: "5112", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 4053, ulicaID: "1809", nrZespolu: "5067", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 4473, ulicaID: "2902", nrZespolu: "5125", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 4824, ulicaID: "2902", nrZespolu: "5124", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 5154, ulicaID: "2902", nrZespolu: "5211", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 5473, ulicaID: "2901", nrZespolu: "5123", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 5833, ulicaID: "2901", nrZespolu: "5122", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 6163, ulicaID: "1816", nrZespolu: "6090", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 6366, ulicaID: "1816", nrZespolu: "6221", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 6870, ulicaID: "1816", nrZespolu: "6091", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 7180, ulicaID: "1816", nrZespolu: "6093", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 7550, ulicaID: "2972", nrZespolu: "6129", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 8180, ulicaID: "1906", nrZespolu: "6155", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 8600, ulicaID: "1247", nrZespolu: "6131", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 9010, ulicaID: "0831", nrZespolu: "6045", typ: "1", nrPrzystanku: "08"),
            RouteStopInfoModel(odleglosc: 9770, ulicaID: "0141", nrZespolu: "6021", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 10173, ulicaID: "0141", nrZespolu: "6052", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 10520, ulicaID: "0141", nrZespolu: "6008", typ: "1", nrPrzystanku: "06"),
            RouteStopInfoModel(odleglosc: 10835, ulicaID: "1505", nrZespolu: "6009", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 11100, ulicaID: "1505", nrZespolu: "6010", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 11396, ulicaID: "1505", nrZespolu: "6011", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 11822, ulicaID: "1505", nrZespolu: "6012", typ: "2", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 12141, ulicaID: "1814", nrZespolu: "6013", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 12635, ulicaID: "1814", nrZespolu: "6070", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 13139, ulicaID: "1222", nrZespolu: "6057", typ: "1", nrPrzystanku: "04"),
            RouteStopInfoModel(odleglosc: 14117, ulicaID: "1222", nrZespolu: "6059", typ: "7", nrPrzystanku: "71")

        ], stopsNum: 32),
        LineRouteModel(routeName: "Custom103DwZachodni", stops: [
            RouteStopInfoModel(odleglosc: 0, ulicaID: "1222", nrZespolu: "6059", typ: "7", nrPrzystanku: "71"),
            RouteStopInfoModel(odleglosc: 365, ulicaID: "1222", nrZespolu: "6059", typ: "5", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 670, ulicaID: "1814", nrZespolu: "6057", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 1045, ulicaID: "1814", nrZespolu: "6070", typ: "1", nrPrzystanku: "02"),
            RouteStopInfoModel(odleglosc: 1667, ulicaID: "1505", nrZespolu: "6013", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 1842, ulicaID: "1505", nrZespolu: "6012", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 2344, ulicaID: "1505", nrZespolu: "6011", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 2579, ulicaID: "1505", nrZespolu: "6010", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 2901, ulicaID: "1505", nrZespolu: "6009", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 3136, ulicaID: "0141", nrZespolu: "6008", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 3542, ulicaID: "0141", nrZespolu: "6052", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 4056, ulicaID: "1113", nrZespolu: "6021", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 4591, ulicaID: "0831", nrZespolu: "6045", typ: "1", nrPrzystanku: "07"),
            RouteStopInfoModel(odleglosc: 4901, ulicaID: "1247", nrZespolu: "6132", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 5301, ulicaID: "1906", nrZespolu: "6131", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 5621, ulicaID: "2972", nrZespolu: "6155", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 6341, ulicaID: "1816", nrZespolu: "6129", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 6621, ulicaID: "1816", nrZespolu: "6093", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 6961, ulicaID: "1816", nrZespolu: "6091", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 7541, ulicaID: "1816", nrZespolu: "6090", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 7871, ulicaID: "2901", nrZespolu: "5122", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 8211, ulicaID: "2901", nrZespolu: "5123", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 8656, ulicaID: "2902", nrZespolu: "5211", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 8973, ulicaID: "2902", nrZespolu: "5124", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 9307, ulicaID: "2902", nrZespolu: "5125", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 9572, ulicaID: "1809", nrZespolu: "5067", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 9963, ulicaID: "1809", nrZespolu: "5112", typ: "1", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 10196, ulicaID: "1809", nrZespolu: "5026", typ: "1", nrPrzystanku: "03"),
            RouteStopInfoModel(odleglosc: 10800, ulicaID: "1809", nrZespolu: "5005", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 11333, ulicaID: "2832", nrZespolu: "5042", typ: "1", nrPrzystanku: "05"),
            RouteStopInfoModel(odleglosc: 11793, ulicaID: "2834", nrZespolu: "5119", typ: "3", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 12093, ulicaID: "null", nrZespolu: "5120", typ: "2", nrPrzystanku: "01"),
            RouteStopInfoModel(odleglosc: 12493, ulicaID: "Tunelowa", nrZespolu: "DwZachodni", typ: "1", nrPrzystanku: "00"),
        ], stopsNum: 33)
    ],
    "105" : [
        LineRouteModel(routeName: "Custom105RondoDaszyńskiego", stops: [
            
        ], stopsNum: 1),
        LineRouteModel(routeName: "Custom105OsGórczewska", stops: [
            
        ], stopsNum: 1)
    ],
    "107" : [
        LineRouteModel(routeName: "Custom107Esperanto", stops: [
            
        ], stopsNum: 1),
        LineRouteModel(routeName: "Custom107MetroWilanowska", stops: [
            
        ], stopsNum: 1)
    ],
    "118" : [
        LineRouteModel(routeName: "Custom118Mariensztat", stops: [
            
        ], stopsNum: 1),
        LineRouteModel(routeName: "Custom118Spartańska", stops: [
            
        ], stopsNum: 1)
    ],
    "120" : [
        LineRouteModel(routeName: "Custom120Olesin", stops: [
            
        ], stopsNum: 1),
        LineRouteModel(routeName: "Custom120DwWschodni", stops: [
            
        ], stopsNum: 1)
    ],
]
