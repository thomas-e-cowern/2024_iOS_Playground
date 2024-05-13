//
//  TargetButton.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/13/24.
//

import Foundation
import SwiftUI

struct TargetButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(40)
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0)]), center: .center, startRadius: 0, endRadius: 50
                )
                .opacity(configuration.isPressed ? 0.8 : 1)
            )
        
            .overlay(circle(with: configuration))
            .overlay(circle(with: configuration).rotationEffect(.init(degrees: 90)))
            .overlay(circle(with: configuration).rotationEffect(.init(degrees: 180)))
            .overlay(circle(with: configuration).rotationEffect(.init(degrees: 270)))
    }
    
    func circle(with configuration: Configuration) -> some View {
        Circle()
            .trim(from: 0.05, to: 0.2)
            .stroke(Color.white, lineWidth: 5)
            .shadow(color: Color.blue, radius: 5)
            .shadow(color: Color.blue, radius: 5)
            .shadow(color: Color.blue, radius: 5)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
}