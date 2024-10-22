//
//  ContentView.swift
//  RebeloperPlayground
//
//  Created by Thomas Cowern on 10/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Root1View()
                .tabItem {
                    Image(systemName: "1.circle")
                }
            Root2View()
                .tabItem {
                    Image(systemName: "2.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
