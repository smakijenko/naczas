//
//  LinesScheduleManager.swift
//  naczas
//
//  Created by Stanisław Makijenko on 21/02/2025.
//

import Foundation

class LinesScheduleManager {
    func fetchAllSchedules() async throws -> [String: [String: [String: StopInfoModel]]] {
        print("Started fetching all schedules.")
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return [:] }
        guard let url = URL(string: "https://api.um.warszawa.pl/api/action/public_transport_routes/?apikey=\(apiKey)") else { return [:]}
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedSchedules = try JSONDecoder().decode(LinesScheduleApiResponse.self, from: data)
        return decodedSchedules.result
    }
}
