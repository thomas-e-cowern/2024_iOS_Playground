//
//  ContentView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.title)
                .foregroundStyle(Color.red)
                .shadow(radius: 10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}