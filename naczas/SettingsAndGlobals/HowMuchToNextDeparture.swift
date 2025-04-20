//
//  HowMuchToNextDeparture.swift
//  naczas
//
//  Created by Stanisław Makijenko on 16/04/2025.
//

import Foundation

func howMuchToNext(depTime: String) -> Int? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    let splitedCurrent = dateFormatter.string(from: Date()).split(separator: ":").map { Int($0)! }
    let splittedDep = depTime.split(separator: ":").map { Int($0)! }
    guard splitedCurrent.count == 3, splittedDep.count == 3 else { return nil }
    let minutes1 = splitedCurrent[0] * 60 + splitedCurrent[1]
    let minutes2 = splittedDep[0] * 60 + splittedDep[1]
    return (minutes2 - minutes1)
}
