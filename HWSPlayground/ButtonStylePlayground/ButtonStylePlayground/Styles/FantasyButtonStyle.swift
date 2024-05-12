//
//  FantasyButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/12/24.
//

import Foundation
import SwiftUI

struct FantasyButtonStyle: ButtonStyle {
    var foregroundGradientStart = Color(red: 1, green: 0.85, blue: 0.85)
    var foregroundGradientEnd = Color(red: 1, green: 0.65, blue: 0.3)

    var backgroundGradientStart = Color(red: 0.33, green: 0.06, blue: 0.04)
    var backgroundGradientEnd = Color(red: 0.5, green: 0.1, blue: 0.1)

    var rimGradientStart = Color(red: 0.725, green: 0.55, blue: 0.3)
    var rimGradientEnd = Color(red: 0.2, green: 0.13, blue: 0.05)

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
    }
}
