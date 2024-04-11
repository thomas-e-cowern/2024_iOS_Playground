//
//  ContentView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    
    let messages: [DataItemModel] = [
        DataItemModel(text: "Hello World", color: .green), DataItemModel(text: "Welcome to swift", color: .orange), DataItemModel(text: "Are you ready to...", color: .yellow), DataItemModel(text: "Start exploring", color: .red), DataItemModel(text: "Awesome!", color: .purple)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Title
            VStack(alignment: .leading, spacing: 0) {
                Text("Greetings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Exploaring iOS Programming")
                    .font(.headline)
                    .fontWeight(.thin)
            }
            
            Spacer()
  
            ForEach(messages, id: \.id) { message in
                TextView(text: message.text, color: message.color)
            }
            
            Spacer()
            
            Spacer()
            
        }
        .padding(.trailing, 20)
    }
}

#Preview {
    ContentView()
}
