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
                
                Button("Go to doctor list screen") {
                    navigate(.doctor(.list))
                }
            }
        }
    }
}

struct ContentContainerView: View {
    
    @State private var routes: [Route] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            ContentView()
                .navigationDestination(for: Route.self) { route in
                    route.destination
                }
        }
        .environment(\.navigate, NavigateAction(action: { route in
            routes.append(route)
        }))
    }
    
}

#Preview {
    ContentContainerView()
}
