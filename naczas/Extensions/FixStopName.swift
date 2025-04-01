//
//  FixStopName.swift
//  naczas
//
//  Created by Stanisław Makijenko on 28/03/2025.
//

extension String {
    func fixStopName() -> String {
        let upperCaseWords = Set(["PIMOT", "PKP", "POLMO", "ICDS", "KŁM", "POD-IMGW", "DKS", "ONZ", "DS", "RKS", "WAT"])
        var fixedStopName = ""
        var currentWord = ""
        
        for (index, char) in self.enumerated() {
            if char == "\"" {
                if !currentWord.isEmpty {
                    if upperCaseWords.contains(currentWord.uppercased()) {
                        fixedStopName.append(currentWord.uppercased())
                    } else {
                        fixedStopName.append(currentWord.first!.uppercased())
                        fixedStopName.append(currentWord.dropFirst().lowercased())
                    }
                    currentWord = ""
                }
                continue
            }
            if char == " " || char == "." || char == "-" {
                if !currentWord.isEmpty {
                    if upperCaseWords.contains(currentWord.uppercased()) {
                        fixedStopName.append(currentWord.uppercased())
                    } else {
                        fixedStopName.append(currentWord.first!.uppercased())
                        fixedStopName.append(currentWord.dropFirst().lowercased())
                    }
                    currentWord = ""
                }
                fixedStopName.append(char)
            } else {
                currentWord.append(char)
                if index == self.count - 1 {
                    if upperCaseWords.contains(currentWord.uppercased()) {
                        fixedStopName.append(currentWord.uppercased())
                    } else {
                        fixedStopName.append(currentWord.first!.uppercased())
                        fixedStopName.append(currentWord.dropFirst().lowercased())
                    }
                }
            }
        }
        return fixedStopName
    }
}
