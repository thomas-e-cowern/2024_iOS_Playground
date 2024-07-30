//
//  ContentView.swift
//  GroupBoxPlayground
//
//  Created by Thomas Cowern on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    
    var isSunny: Bool = false
    
    var body: some View {
        VStack {
            GroupBox(label: Text("Hellow World"), content: {
                Text("This is the content and it grow")
            })
            .frame(width: 300)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
