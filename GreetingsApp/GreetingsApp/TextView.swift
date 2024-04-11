//
//  TextView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI

struct TextView: View {
    
    let text: String
    @State var color: Color
    
    let colors: [Color] = [
        .red,
        .green,
        .blue,
        .orange,
        .pink,
        .purple,
        Color(red: 0.5, green: 0, blue: 0.5),
                           
        Color(red: 0, green: 0.5, blue: 0.5),
                           
        Color(red: 0.5, green: 0.5, blue: 0)
    ]
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding()
            .foregroundStyle(Color.white)
            .background(color.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: color, radius: 5, x: 10, y: 10)
            .onTapGesture {
                // randomly change color
                withAnimation {
                    color = colors.randomElement() ?? .blue
                }
            }
    }
}

#Preview {
    VStack {
        TextView(text: "Hello World", color: .green)
        TextView(text: "What!", color: .blue)
        TextView(text: "Sup", color: .yellow)
    }
}
