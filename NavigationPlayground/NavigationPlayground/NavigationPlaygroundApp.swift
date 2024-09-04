//
//  NavigationPlaygroundApp.swift
//  NavigationPlayground
//
//  Created by Thomas Cowern on 9/4/24.
//

import SwiftUI

@main
struct NavigationPlaygroundApp: App {

    @State private var routes: [Route] = []
    
    var body: some Scene {
        WindowGroup {
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
}
