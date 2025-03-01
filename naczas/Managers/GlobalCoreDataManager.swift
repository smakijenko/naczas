//
//  GlobalCoreDataManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 01/03/2025.
//
import SwiftData
import SwiftUI

@MainActor
class GlobalCoreDataManager {
    static let shared = GlobalCoreDataManager()
    private let container: ModelContainer
    @Published var linesRoutes: [LineRoutsEntity] = []
    @Published var stops: [StopEntity] = []
    
    private init() {
        do {
            let schema = Schema([LineRoutsEntity.self])
            let config = ModelConfiguration(isStoredInMemoryOnly: false)
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Błąd inicjalizacji bazy danych: \(error)")
        }
    }
    
    func updateLineRoutesAndStops() async throws {
        do {
            if try areLineRoutsEntitiesInDB() {
                print("There are LineRouts entities already in the database.")
                linesRoutes = fetchLinesRoutes()
            }
            else {
                print("There are no LineRouts entities already in the database.")
                try await addLinesRoutes()
                linesRoutes = fetchLinesRoutes()
            }
            
            if try areStopsEntitiesInDB() {
                print("There are Stops entities already in the database.")
                stops = fetchStops()
            }
            else {
                print("There are no Stops entities already in the database.")
                try await addStops()
                stops = fetchStops()
            }
        } catch {
            print("Błąd zapisu: \(error)")
            throw error
        }
    }
}

// Methodes for LineRoutesEntities
extension GlobalCoreDataManager
{
    func addLinesRoutes() async throws {
        let context = container.mainContext
        do {
            let linesRoutes = try await LinesScheduleManager().provideAllRoutsForLines()
            for lineRoutes in linesRoutes {
                let newLineRoutes = LineRoutsEntity(lineName: lineRoutes.lineName, routes: lineRoutes.routes)
                context.insert(newLineRoutes)
            }
            try context.save()
        } catch {
            print("Błąd zapisu: \(error)")
        }
    }
    
    func fetchLinesRoutes() -> [LineRoutsEntity] {
        let context = container.mainContext
        let descriptor = FetchDescriptor<LineRoutsEntity>()
        do {
            return try context.fetch(descriptor)
        } catch {
            print("Błąd pobierania danych: \(error)")
            return []
        }
    }
    
    func areLineRoutsEntitiesInDB() throws -> Bool {
        let context = container.mainContext
        let descriptor = FetchDescriptor<LineRoutsEntity>()
        do {
            let entities = try context.fetch(descriptor)
            if entities.isEmpty { return false }
        } catch {
            print("Błąd pobierania danych z Swift Data: \(error)")
            throw URLError(.badServerResponse)
        }
        return true
    }
    
}

// Methodes for StopsEnities
extension GlobalCoreDataManager
{
    func addStops() async throws {
        let context = container.mainContext
        do {
            let stops = try await StopsManager().fetchAllStops()
            for (key, value) in stops {
                let newStopEntity = StopEntity(stopKeys: key, stopValues: value)
                context.insert(newStopEntity)
            }
            try context.save()
        } catch {
            print("Błąd zapisu: \(error)")
        }
    }
    
    func fetchStops() -> [StopEntity] {
        let context = container.mainContext
        let descriptor = FetchDescriptor<StopEntity>()
        do {
            return try context.fetch(descriptor)
        } catch {
            print("Błąd pobierania danych: \(error)")
            return []
        }
    }
    
    func areStopsEntitiesInDB() throws -> Bool {
        let context = container.mainContext
        let descriptor = FetchDescriptor<StopEntity>()
        do {
            let entities = try context.fetch(descriptor)
            if entities.isEmpty { return false }
        } catch {
            print("Błąd pobierania danych z Swift Data: \(error)")
            throw error
        }
        return true
    }
    
}

