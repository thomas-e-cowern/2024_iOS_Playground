//
//  ColoredButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/10/24.
//

import Foundation
import SwiftUI

struct ColoredButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 50)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(Color.white)
            .overlay {
                Color.black
                    .opacity(configuration.isPressed ? 0.3 : 0)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
    }
}
