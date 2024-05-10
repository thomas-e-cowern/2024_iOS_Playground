//
//  StripedRectangleButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/10/24.
//

import Foundation
import SwiftUI

struct StripedRectangleButtonStyle: ButtonStyle {
    var offColor = Color.blue
    var onColor = Color.green
    
    func color(for configuration: Configuration) -> Color {
        configuration.isPressed ? onColor : offColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Rectangle()
                .fill(color(for: configuration))
                .frame(width: configuration.isPressed ? 20 : 10)
            
            configuration.label
                .padding()
                .foregroundStyle(color(for: configuration))
                .textCase(.uppercase)
                .font(Font.title.bold())
                .border(color(for: configuration), width: 4)
            
        }
        .fixedSize()
        .animation(nil, value: 0)
    }
}
