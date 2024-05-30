//
//  HoveringRevealingLabelStyle.swift
//  CustomLabelPlayground
//
//  Created by Thomas Cowern on 5/30/24.
//

import Foundation
import SwiftUI

struct VerticalRevealingLabelStyle: HoveringLabelStyle {
    let hovering: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
                .opacity(hovering ? 1 : 0)
        }
        .contentShape(Circle())
    }
}
