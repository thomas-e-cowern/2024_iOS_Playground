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
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    ContentView()
}
