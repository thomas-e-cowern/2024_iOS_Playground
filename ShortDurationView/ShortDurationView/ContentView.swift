//
//  ContentView.swift
//  ShortDurationView
//
//  Created by Thomas Cowern on 9/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textIsVisible: Bool = false
    @State private var circleIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Show") {
                textIsVisible = true
                circleIsVisible = true
            }
            
            Circle()
                .fill(.blue)
                .frame(width: 100)
                .show(duration: .seconds(4), isVisible: $circleIsVisible)
            
            Text("This is the message you will see for 2 seconds")
                .padding()
                .foregroundStyle(Color.white)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .show(duration: .seconds(2), isVisible: $textIsVisible)
        }
    }
}

#Preview {
    ContentView()
}
