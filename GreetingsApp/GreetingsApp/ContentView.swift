//
//  ContentView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
  
            TextView(text: "Hello World", color: .green)
            
            TextView(text: "Welcome to swift", color: .orange)
            
            TextView(text: "Are you ready to...", color: .yellow)
            
            TextView(text: "Start exploring", color: .red)
            
            TextView(text: "Awesome!", color: .purple)
            
        }
    }
}

#Preview {
    ContentView()
}
