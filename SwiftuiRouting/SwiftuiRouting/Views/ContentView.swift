//
//  ContentView.swift
//  SwiftuiRouting
//
//  Created by Thomas Cowern on 3/4/24.
//

import SwiftUI

enum AppScreen: Hashable, Identifiable, CaseIterable {
    case backyards
    case birds
    case plants
    
    var id: AppScreen { self }
}

extension AppScreen {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .backyards:
            Label("Backyards", systemImage: "tree")
        case .birds:
            Label("Birds", systemImage: "bird")
        case .plants:
            Label("Plants", systemImage: "leaf")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .backyards:
            Text("Backyards")
        case .birds:
            Text("Birds")
        case .plants:
            Text("Plants")
        }
    }
}

struct AppTabView: View {
    
    @Binding var selection: AppScreen?
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
                    .tag(screen as AppScreen?)
                    .tabItem {
                        screen.label
                    }
            }
        }
    }
}

struct ContentView: View {
    
    @State private var selection: AppScreen? = .backyards
    
    var body: some View {
        VStack {
            AppTabView(selection: $selection)
        }
    }
}

#Preview {
    ContentView()
}
