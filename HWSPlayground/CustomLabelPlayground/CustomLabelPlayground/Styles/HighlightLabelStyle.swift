//
//  HighlightLabelStyle.swift
//  CustomLabelPlayground
//
//  Created by Thomas Cowern on 5/30/24.
//

import Foundation
import SwiftUI

struct HighlightLabelStyle: HoveringLabelStyle {
    let hovering: Bool

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
        .padding()
        .background(
            Capsule()
                .fill(Color.accentColor.opacity(hovering ? 0.2 : 0))
        )
        .contentShape(Capsule())
    }
}
