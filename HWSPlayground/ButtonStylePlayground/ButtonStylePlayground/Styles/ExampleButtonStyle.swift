//
//  ExampleButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/29/24.
//

import Foundation
import SwiftUI

struct ExampleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundStyle(Color.white)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
