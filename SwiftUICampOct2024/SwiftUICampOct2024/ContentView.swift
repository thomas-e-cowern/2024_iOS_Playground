//
//  ContentView.swift
//  SwiftUICampOct2024
//
//  Created by Thomas Cowern on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var privateData = "Hello World"
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            Text(privateData)
            Button("Tap me") {
                privateData = "Hello SwiftUI camp"
            }
            
            // Pull in view example
//            Text("Hi, I'm a preview!")
//                .background(Color.red)
            
            // Push out view example
//            Color.blue
//            Color.green
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
