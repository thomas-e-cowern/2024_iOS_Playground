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
    
    let subtitles: [LocalizedStringKey] = [
        "Exploaring iOS Programming",
        "Programming Recipes",
        "A quest for knowledge",
        "A search for employment"
    ]
    
    var angle: Angle {
        isRotated ? .zero : .degrees(360)
    }
    
    var angularGradient: AngularGradient {
        AngularGradient(gradient: Gradient(colors: [.blue, .red, .orange]), center: .center, angle: .zero)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Greetings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.headline)
                    .fontWeight(.thin)
                
                
            }
            .onTapGesture {
                // change subtitle
                subtitle =  subtitles.randomElement() ?? LocalizedStringKey("This is empty...")
            }
            
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
