//
//  TrimTimeString.swift
//  naczas
//
//  Created by Stanisław Makijenko on 10/04/2025.
//

extension String {
    func trimTime() -> String {
        let components = self.split(separator: ":")
        guard components.count >= 2 else { return self }
        return "\(components[0]):\(components[1])"
    }
}
