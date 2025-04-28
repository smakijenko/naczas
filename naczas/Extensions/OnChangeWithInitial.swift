//
//  OnChangeWithInitial.swift
//  naczas
//
//  Created by Stanisław Makijenko on 25/04/2025.
//

import SwiftUI

extension View {
    func onChangeWithInitial<T: Equatable>(
        of value: T,
        perform: @escaping (T) -> Void
    ) -> some View {
        self
            .onAppear {
                perform(value)
            }
            .onChange(of: value) {
                perform(value)
            }
    }
}
