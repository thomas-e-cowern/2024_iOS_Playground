//
//  ContentView.swift
//  NavigationPlayground
//
//  Created by Thomas Cowern on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.navigate) var navigate: NavigateAction
    @State private var route: [Route] = []
    
    var body: some View {
        NavigationStack(path: $route) {
            VStack {
                Button("Go to patient list screen") {
                    navigate(.patient(.list))
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
