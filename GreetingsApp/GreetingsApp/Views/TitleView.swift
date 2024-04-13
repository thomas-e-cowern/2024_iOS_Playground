//
//  TitleView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI

struct TitleView: View {
    
    @State private var subtitle: LocalizedStringKey = "Exploaring iOS Programming"
    @State private var isRotated: Bool = false
    
    let lineWidth = 15.0
    let diameter = 70.0
    
    var angle: Angle {
        isRotated ? .zero : .degrees(360)
    }
    
    var angularGradient: AngularGradient {
        AngularGradient(gradient: Gradient(colors: [.blue, .red, .orange]), center: .center, angle: .zero)
    }
    
    var body: some View {
        HStack {

            GreetingsTextView(subtitle: $subtitle)
            
            Spacer()
            
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
        
        Spacer()
    }
}

#Preview {
    TitleView()
        .padding()
}
