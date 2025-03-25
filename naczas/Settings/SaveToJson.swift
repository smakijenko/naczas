//
//  SaveToJson.swift
//  naczas
//
//  Created by Stanisław Makijenko on 24/03/2025.
//

import Foundation

func saveRoutesToJSON(routes: [String: [LineRouteModel]], fileName: String) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
        let jsonData = try encoder.encode(routes)
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            try jsonData.write(to: fileURL)
            print("Plik zapisano w: \(fileURL.path)")
        }
    } catch {
        print("Błąd zapisu JSON: \(error)")
    }
}
