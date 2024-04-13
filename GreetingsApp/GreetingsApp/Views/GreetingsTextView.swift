//
//  GreetingsTextView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/13/24.
//

import SwiftUI

struct GreetingsTextView: View {
    
    @Binding var subtitle: LocalizedStringKey
    
    let subtitles: [LocalizedStringKey] = [
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
            subtitle =  subtitles.randomElement() ?? LocalizedStringKey("This is empty...")
        }
    }
}

#Preview {
    GreetingsTextView(subtitle: .constant("Exploaring iOS Programming"))
}
