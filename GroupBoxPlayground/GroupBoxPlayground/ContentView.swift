//
//  ContentView.swift
//  GroupBoxPlayground
//
//  Created by Thomas Cowern on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GroupBox(label: Text("Hellow World"), content: {
                Text("This is the content and it grow")
            })
            .groupBoxStyle(CustomGroupBoxStyle())
            .frame(width: 300)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
