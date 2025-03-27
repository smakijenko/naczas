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
    case unableToFindJSONFile
    case unableToFetchCustomRoutes
    
    case tooManyAttemptsWhileFetchingAllStops
    case tooManyAttemptsWhileFetchingAllRoutesForAllLines
    case unableToAddEntities
    case unableToFetchEntitiesFromDB
    case unableToLoadSwiftData
    case unableToDeleteEntities
    
    case containerMainContextNotFound
    case unableToInitializeContainer
    
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
        case .unableToFindJSONFile:
            return "Error: It was not possible to find JSON file with custom routes."
        case .unableToFetchCustomRoutes:
            return "Error: It was not possible to fetch custom routes."
            
            
        case .tooManyAttemptsWhileFetchingAllStops:
            return "Error: Too many attempts while fetching all stops."
        case .tooManyAttemptsWhileFetchingAllRoutesForAllLines:
            return "Error: Too many attempts while fetching all routes for all lines."
        case .unableToAddEntities:
            return "Error: It was not possible to add entities."
        case .unableToFetchEntitiesFromDB:
            return "Error: It was not possible to fetch entities."
        case .unableToLoadSwiftData:
            return "Error: It was not possible to load SwiftData."
        case .unableToDeleteEntities:
            return "Error: It was not possible to delete entities."
            
        case .containerMainContextNotFound:
            return "Error: It was not possible to find container's main context."
        case .unableToInitializeContainer:
            return "Error: It was not possible initialize container."
        }
    }
}
