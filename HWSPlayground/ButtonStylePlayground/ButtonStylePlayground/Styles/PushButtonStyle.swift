//
//  PushButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/10/24.
//

import SwiftUI

struct PushButtonStyle: ButtonStyle {
    let lightGray = Color(white: 0.8)

    func makeBody(configuration: Self.Configuration) -> some View {
        let startEdge: UnitPoint
        let endEdge: UnitPoint

        if configuration.isPressed {
            startEdge = UnitPoint.bottomTrailing
            endEdge = UnitPoint.topLeading
        } else {
            startEdge = UnitPoint.topLeading
            endEdge = UnitPoint.bottomTrailing
        }

        return configuration.label
            .foregroundColor(Color.black.opacity(configuration.isPressed ? 0.7 : 1))
            .font(.largeTitle)
            .padding(40)
            .background(
                LinearGradient(gradient: Gradient(colors: [lightGray, .white]), startPoint: startEdge, endPoint: endEdge)
            )
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color.white, lightGray]), startPoint: startEdge, endPoint: endEdge),
                        lineWidth: 16
                    )
                    .padding(2)
                    .overlay(
                        Circle()
                            .stroke(configuration.isPressed ? Color.black : Color.gray, lineWidth: 4)
                    )
            )
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 10, x: 10, y: 10)
            .animation(nil, value: 0)
    }
}
