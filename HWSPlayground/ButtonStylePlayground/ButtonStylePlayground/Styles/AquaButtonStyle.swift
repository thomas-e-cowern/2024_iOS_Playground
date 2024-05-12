//
//  AquaButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/12/24.
//

import Foundation
import SwiftUI

struct AquaButtonStyle: ButtonStyle {
    
    let blueHighlight = Color(red: 0.7, green: 1, blue: 1)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding(.horizontal, 20)
            .background(
                ZStack {
                    Color(red: 0.3, green: 0.6, blue: 1)
                    
                    Capsule()
                        .inset(by: 8)
                        .offset(y: 8)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [blueHighlight.opacity(0), blueHighlight]),
                                startPoint: .top,
                                endPoint: .init(x: 0.5, y: 0.8)
                            )
                        )
                        .scaleEffect(y: 0.7, anchor: .bottom)
                        .blur(radius: configuration.isPressed ? 5 : 10)
                    
                    Capsule()
                        .inset(by: 4)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white, Color.white.opacity(0)]),
                                startPoint: .top,
                                endPoint: UnitPoint(x: 0.5, y: 0.8)
                            )
                        )
                        .scaleEffect(x: 0.95, y: 0.7, anchor: .top)
                    
                    if configuration.isPressed {
                        Color.blue.opacity(0.2)
                    }
                }
            )
            .clipShape(Capsule())
        
            .overlay(
                Capsule()
                    .strokeBorder(Color.black.opacity(0.25), lineWidth: 1)
            )
    }
}

