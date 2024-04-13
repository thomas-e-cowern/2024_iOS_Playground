//
//  RotatableCircleView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/13/24.
//

import SwiftUI

struct RotatableCircleView: View {
    
    @Binding var isRotated: Bool
    
    let lineWidth = 15.0
    let diameter = 70.0
    
    var angle: Angle {
        isRotated ? .zero : .degrees(360)
    }
    
    var angularGradient: AngularGradient {
        AngularGradient(gradient: Gradient(colors: [.blue, .red, .orange]), center: .center, angle: .zero)
    }
    
    var body: some View {
        Circle()
            .strokeBorder(angularGradient, lineWidth: lineWidth)
            .rotationEffect(angle)
            .frame(width: diameter, height: diameter)
            .onTapGesture {
                withAnimation {
                    isRotated.toggle()
                }
            }
    }
}

#Preview {
    RotatableCircleView(isRotated: .constant(false))
}
