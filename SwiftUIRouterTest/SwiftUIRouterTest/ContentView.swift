//
//  ContentView.swift
//  SwiftUIRouterTest
//
//  Created by Thomas Cowern on 9/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navPath = [Routes]()
    @State private var name: String = "Default"
    
    var body: some View {
        NavigationStack(path: $navPath) {
            ListView(navPaths: $navPath)
                .navigationDestination(for: Routes.self) { route in
                    switch (route) {
                    case .list:
                        ListView(navPaths: $navPath)
                    case .detail:
                        DetailView(navPaths: $navPath, name: name)
                    case .settings:
                        SettingsView(navPaths: $navPath)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
