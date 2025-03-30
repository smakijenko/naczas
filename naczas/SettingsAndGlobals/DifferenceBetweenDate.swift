//
//  DifferenceBetweenDate.swift
//  naczas
//
//  Created by Stanisław Makijenko on 30/03/2025.
//

import Foundation

func differenceBetweenDate(lastUpdateString: String) -> Double? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let currentDate = Date()
    guard let lastUpdateDate = formatter.date(from: lastUpdateString) else { return nil }
    let differenceInMinutes = currentDate.timeIntervalSince(lastUpdateDate) / 60
    return differenceInMinutes
}
