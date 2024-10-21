//
//  ContentView.swift
//  NavigationAnimationsPlayground
//
//  Created by Thomas Cowern on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink("Destination View") {
                DestinationView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
