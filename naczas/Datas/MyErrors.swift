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
    case tooManyAttemptsWhileProvidingActiveLines
    case unableToFindJSONFile
    case unableToFetchCustomRoutes
    case unableToProvideMainRoutes
    case unableToLoadPreferredRoutes
    case APIResponseEmpty
    case activeBusesTramsNotFound
    case tooManyAttemptsWhileProvidingLinesFromStop

    
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
        case .tooManyAttemptsWhileProvidingActiveLines:
            return "Error: Too many attempts while providing active lines."
        case .unableToFindJSONFile:
            return "Error: It was not possible to find JSON file with custom routes."
        case .unableToFetchCustomRoutes:
            return "Error: It was not possible to fetch custom routes."
        case .unableToProvideMainRoutes:
            return "Error: It was not possible to provide main routes."
        case .unableToLoadPreferredRoutes:
            return "Error: It was not possible to provide preferred routes for given line."
        case .APIResponseEmpty:
            return "Error: Routes for lines API response is empty."
        case .activeBusesTramsNotFound:
            return "Error: Could not find active buses and trams."
        case .tooManyAttemptsWhileProvidingLinesFromStop:
            return "Error: It was not possible to provide lines from stop."
            
            
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
