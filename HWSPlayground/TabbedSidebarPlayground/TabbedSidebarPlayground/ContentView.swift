//
//  ContentView.swift
//  TabbedSidebarPlayground
//
//  Created by Thomas Cowern on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabbedSidebar(content: [
            TitledView(title: "Home", systemImage: "house", view: Text("Home")),
            TitledView(title: "Buy", systemImage: "cart", view: Text("Buy")),
            TitledView(title: "Account", systemImage: "person.circle", view: Text("Account"))
        ])
    }
}

#Preview {
    ContentView()
}
