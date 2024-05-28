//
//  AnimatedButtonStyle.swift
//  ButtonStylePlayground
//
//  Created by Thomas Cowern on 5/28/24.
//

import Foundation
import SwiftUI


struct AnimatedButtonStyle: ButtonStyle {
    
    @State private var animation = 0.0
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
            .foregroundStyle(Color.white)
            .padding(4)
            .overlay {
                Circle()
                    .stroke(Color.blue, lineWidth: 2)
                    .scaleEffect(CGFloat(1 + animation))
                    .opacity(1 - animation)
            }
            .onAppear {
                withAnimation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false)) {
                    animation = 1
                }
            }
    }
}
