//
//  ContentView.swift
//  SidebarTest
//
//  Created by Thomas Cowern on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: HomeView()) {
                    Label("Courses", systemImage: "book")
                }
                NavigationLink(destination: HomeView()) {
                    Label("Tutorials", systemImage: "square")
                }
            }
            .navigationTitle("Learn")
            
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
