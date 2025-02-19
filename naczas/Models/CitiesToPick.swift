//
//  CitiesToPick.swift
//  naczas
//
//  Created by Stanisław Makijenko on 16/02/2025.
//

enum AvailableCitiesToPick: String, CaseIterable{
    case Warszawa, Kraków, Gdańsk, Łódź
    var name: String { rawValue }
}
