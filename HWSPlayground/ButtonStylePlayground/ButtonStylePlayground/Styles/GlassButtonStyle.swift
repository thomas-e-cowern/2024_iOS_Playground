//
//  GlassButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/10/24.
//

import SwiftUI

struct GlassButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .font(Font.largeTitle.bold())
                .foregroundColor(color)
                .offset(x: -1, y: -1)

            configuration.label
                .font(Font.largeTitle.bold())
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            color
                .overlay(
                    LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: Color.white.opacity(0.6), location: 0),
                        Gradient.Stop(color: Color.white.opacity(0.15), location: 0.499),
                        Gradient.Stop(color: Color.white.opacity(0), location: 0.5),
                        Gradient.Stop(color: Color.white.opacity(0), location: 0.8),
                        Gradient.Stop(color: Color.white.opacity(0.2), location: 1)
                    ]), startPoint: .top, endPoint: .bottom)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(Color.white.opacity(0.4), lineWidth: configuration.isPressed ? 5 : 1)
                )
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
