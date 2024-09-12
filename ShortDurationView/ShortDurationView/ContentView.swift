//
//  ContentView.swift
//  ShortDurationView
//
//  Created by Thomas Cowern on 9/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isVisible: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Show") {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
