//
//  VerticalLabelStyle.swift
//  CustomLabelPlayground
//
//  Created by Thomas Cowern on 5/30/24.
//

import Foundation
import SwiftUI

struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
        .padding()
        .overlay(
            Capsule()
                .stroke(Color.accentColor, lineWidth: 2)
        )
    }
}
