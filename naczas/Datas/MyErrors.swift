//
//  MyErrors.swift
//  naczas
//
//  Created by Stanisław Makijenko on 24/02/2025.
//

import Foundation

enum MyError: Error, LocalizedError, Equatable {
    case noLine
    case wrongKey
    case wrongURL
    case tooManyAttemptsWhileFetchingMainRoutes
    case tooManyAttemptsWhileFetchingAllLines
    case unableToLoadCoreData
    var errorDescription: String? {
        switch self {
        case .noLine:
            return "Error: There is no given line in schedules."
        case .wrongKey:
            return "Error: Given API key is wrong."
        case .wrongURL:
            return "Error: Given URL is wrong."
        case .tooManyAttemptsWhileFetchingMainRoutes:
            return "Error: Too many attempts while fetching main routes."
        case .tooManyAttemptsWhileFetchingAllLines:
            return "Error: Too many attempts while fetching all available lines."
        case .unableToLoadCoreData:
            return "Error: It was not possible to load CoreData."
        }
    }
}
