//
//  TitleView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/11/24.
//

import SwiftUI

struct TitleView: View {
    
    @State private var subtitle = "Exploaring iOS Programming"
    
    let subtitles: [String] = [
        "Exploaring iOS Programming",
        "Programming Recipes",
        "A quest for knowledge",
        "A search for employment"
    ]
    
    var body: some View {
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
            subtitle =  subtitles.randomElement() ?? "This is empty..."
        }
    }
}

#Preview {
    TitleView()
}
