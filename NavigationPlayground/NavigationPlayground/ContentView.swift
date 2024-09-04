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
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .navigationDestination(for: Route.self) { route in
                        route.destination
                    }

            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
