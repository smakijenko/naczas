//
//  LineSearcherViewModel.swift
//  naczas
//
//  Created by Stanisław Makijenko on 17/02/2025.
//

import Foundation
import SwiftUI

class LineSearcherViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var isSearching: Bool = true
}
