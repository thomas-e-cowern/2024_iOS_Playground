//
//  TextView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI

struct TextView: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding()
            .foregroundStyle(Color.white)
            .background(color.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: color, radius: 5, x: 10, y: 10)
    }
}

#Preview {
    VStack {
        TextView(text: "Hello World", color: .green)
        TextView(text: "What!", color: .blue)
        TextView(text: "Sup", color: .yellow)
    }
}
