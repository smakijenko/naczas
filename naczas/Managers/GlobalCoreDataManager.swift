//
//  GlobalDataManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 01/03/2025.
//
import SwiftData
import SwiftUI

@MainActor
class GlobalDataManager: ObservableObject {
    @Published var showSwiftDataIssueAlert: Bool = false
    @Published var isDatasAvailable: Bool = false
    @Published var linesRoutes: [LineRoutsEntity] = []
    @Published var stops: [StopEntity] = []
    static let shared = GlobalDataManager()
    private let container: ModelContainer?
    let swiftDataIssuealertMessage: String = "Wystąpił problem z załadowaniem danych. Spróbuj ponownie lub zrestartuj aplikacje."
    
    
    init() {
        do {
            let schema = Schema([LineRoutsEntity.self, StopEntity.self])
            let config = ModelConfiguration(isStoredInMemoryOnly: false)
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            print(MyError.unableToInitializeContainer.localizedDescription)
            container = nil
            showSwiftDataIssueAlert = true
        }
        Task {
//            await updateLineRoutesAndStops()
        }
    }
    
    func updateLineRoutesAndStops() async {
        do {
            if try areLineRoutsEntitiesInDB() {
                print("There are LineRouts entities already in the database.")
                linesRoutes = try fetchLinesRoutes()
            }
            else {
                print("There are no LineRouts entities already in the database.")
                try await addLinesRoutes()
                linesRoutes = try fetchLinesRoutes()
            }
            
            if try areStopsEntitiesInDB() {
                print("There are Stops entities already in the database.")
                stops = try fetchStops()
            }
            else {
                print("There are no Stops entities already in the database.")
                try await addStops()
                stops = try fetchStops()
            }
            print("Swift Data was fetched successfully.")
            isDatasAvailable = true
        } catch {
            showSwiftDataIssueAlert = true
        }
    }
    
    func retryUpdate() async {
        showSwiftDataIssueAlert = false
        await updateLineRoutesAndStops()
    }
}

// Methodes for LineRoutesEntities
extension GlobalDataManager
{
    func addLinesRoutes() async throws {
        print("Started adding LineRouts entities")
        guard let context = container?.mainContext else {
            print("addLinesRoutes: " + MyError.containerMainContextNotFound.localizedDescription)
            throw MyError.containerMainContextNotFound
        }
        do {
            let linesRoutes = try await LinesScheduleManager().provideAllRoutsForLines()
            for lineRoutes in linesRoutes {
                let newLineRoutes = LineRoutsEntity(lineName: lineRoutes.lineName, routes: lineRoutes.routes)
                context.insert(newLineRoutes)
            }
            try context.save()
        }
        catch {
            print("addLinesRoutes: " + MyError.unableToAddEntities.localizedDescription)
            throw MyError.unableToAddEntities
        }
    }
    
    func fetchLinesRoutes() throws -> [LineRoutsEntity] {
        guard let context = container?.mainContext else {
            print("fetchLinesRoutes: " + MyError.containerMainContextNotFound.localizedDescription)
            throw MyError.containerMainContextNotFound
        }
        let descriptor = FetchDescriptor<LineRoutsEntity>()
        do {
            return try context.fetch(descriptor)
        } catch {
            print("fetchLinesRoutes: " + MyError.unableToFetchEntitiesFromDB.localizedDescription)
            throw MyError.unableToFetchEntitiesFromDB
        }
    }
    
    func areLineRoutsEntitiesInDB() throws -> Bool {
        guard let context = container?.mainContext else {
            print("areLineRoutsEntitiesInDB: " + MyError.containerMainContextNotFound.localizedDescription)
            throw MyError.containerMainContextNotFound
        }
        let descriptor = FetchDescriptor<LineRoutsEntity>()
        do {
            let entities = try context.fetch(descriptor)
            if entities.isEmpty { return false }
        } catch {
            print("areLineRoutsEntitiesInDB: " + MyError.unableToLoadSwiftData.localizedDescription)
            throw MyError.unableToLoadSwiftData
        }
        return true
    }
}

// Methodes for StopsEnities
extension GlobalDataManager
{
    func addStops() async throws {
        print("Started adding Stops entities.")
        guard let context = container?.mainContext else {
            print("addStops: " + MyError.containerMainContextNotFound.localizedDescription)
            throw MyError.containerMainContextNotFound
        }
        do {
            let stops = try await StopsManager().provideAllStopsInDict()
            for (key, value) in stops {
                let newStopEntity = StopEntity(stopKeys: key, stopValues: value)
                context.insert(newStopEntity)
            }
            try context.save()
        }
        catch {
            print("addStops: " + MyError.unableToAddEntities.localizedDescription)
            throw MyError.unableToAddEntities
        }
    }
    
    func fetchStops() throws -> [StopEntity] {
        guard let context = container?.mainContext else {
            print("fetchStops: " + MyError.containerMainContextNotFound.localizedDescription)
            throw MyError.containerMainContextNotFound
        }
        let descriptor = FetchDescriptor<StopEntity>()
        do {
            return try context.fetch(descriptor)
        } catch {
            print("fetchStops: " + MyError.unableToFetchEntitiesFromDB.localizedDescription)
            throw MyError.unableToFetchEntitiesFromDB
        }
    }
    
    func areStopsEntitiesInDB() throws -> Bool {
        guard let context = container?.mainContext else {
            print("areStopsEntitiesInDB: " + MyError.containerMainContextNotFound.localizedDescription)
            throw MyError.containerMainContextNotFound
        }
        let descriptor = FetchDescriptor<StopEntity>()
        do {
            let entities = try context.fetch(descriptor)
            if entities.isEmpty { return false }
        } catch {
            print("areStopsEntitiesInDB: " + MyError.unableToLoadSwiftData.localizedDescription)
            throw MyError.unableToLoadSwiftData
        }
        return true
    }
}

