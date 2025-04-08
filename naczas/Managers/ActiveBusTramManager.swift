//
//  ActiveBusTramManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 01/04/2025.
//

import Foundation

class ActiveBusTramManager: ObservableObject {
    static let shared = ActiveBusTramManager()
    @Published var activeBuses: [String : [ActiveBusTramModel]] = [:]
    @Published var activeTrams: [String : [ActiveBusTramModel]] = [:]
    @Published var isDataLoaded: Bool = false
    @Published var showNoBusTramsAlert: Bool = false
    let noBusTramsAlertMessage: String = "Wystąpił problem z załadowaniem aktywnych busów i tramwajów. Spróbuj ponownie lub zrestartuj aplikacje."
    
    // Type: 1 - Buses, 2 - Trams
    private func fetchActiveBusTram(type: String) async throws -> [ActiveBusTramModel] {
        print("Started fetching all available lines from API.")
        let apiKey = try getApiKey()
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/busestrams_get/?resource_id=%20f2e5503e927d-4ad3-9500-4ab9e55deb59&apikey=\(apiKey)&type=\(type)") else {
            print(("fetchAllAvailableLines: \(MyError.wrongURL.localizedDescription)"))
            throw MyError.wrongURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedAvailableLines = try JSONDecoder().decode(ActiveBusTramApiResponse.self, from: data)
        if decodedAvailableLines.result.isEmpty {
            print("fetchAllAvailableLines: \(MyError.APIResponseEmpty.localizedDescription)")
            throw MyError.APIResponseEmpty
        }
        return decodedAvailableLines.result
    }
    
    private func convertIntoDict(actives: [ActiveBusTramModel]) -> [String : [ActiveBusTramModel]] {
        var dict: [String : [ActiveBusTramModel]] = [:]
        for active in actives {
            if dict[active.lines] == nil {
                dict[active.lines] = [active]
            }
            else {
                dict[active.lines]?.append(active)
            }
        }
        return dict
    }
    
    private func provideActiveBuses() async throws {
        print("Started providing active buses in dict.")
        for attempt in 1 ... 10 {
            print("Attempt: \(attempt)")
            do {
                let buses = try await fetchActiveBusTram(type: "1")
                let busesDict = convertIntoDict(actives: buses)
                if !busesDict.isEmpty {
                    await MainActor.run {
                        activeBuses = busesDict
                    }
                    return
                }
            }
            catch {
                print("Attempt \(attempt) failed with error: \(error)")
            }
            try! await Task.sleep(nanoseconds: 1_500_000_000)
        }
        print("loadAvailableLines: \(MyError.tooManyAttemptsWhileProvidingActiveLines.localizedDescription)")
        throw MyError.tooManyAttemptsWhileProvidingActiveLines
    }
    
    private func provideActiveTrams() async throws {
        print("Started providing active trams in dict.")
        for attempt in 1 ... 10 {
            print("Attempt: \(attempt)")
            do {
                let trams = try await fetchActiveBusTram(type: "2")
                let tramsDict = convertIntoDict(actives: trams)
                if !tramsDict.isEmpty {
                    await MainActor.run {
                        activeTrams = tramsDict
                    }
                    return
                }
            }
            catch {
                print("Attempt \(attempt) failed with error: \(error)")
            }
            try await Task.sleep(nanoseconds: 1_500_000_000)
        }
        print("provideActiveTrams: \(MyError.tooManyAttemptsWhileProvidingActiveLines.localizedDescription)")
        throw MyError.tooManyAttemptsWhileProvidingActiveLines
    }
    
    func loadActiveBusesTrams() async {
        await MainActor.run {
            isDataLoaded = false
            showNoBusTramsAlert = false
        }
        do {
            try await provideActiveBuses()
            try await provideActiveTrams()
            await MainActor.run {
                if !activeBuses.isEmpty && !activeTrams.isEmpty {
                    isDataLoaded = true
                }
            }
        }
        catch {
            showNoBusTramsAlert = true
        }
    }
}
