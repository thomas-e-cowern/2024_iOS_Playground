//
//  ContentView.swift
//  FilteringList
//
//  Created by Thomas Cowern on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    
    let users = Bundle.main.decode([User].self, from: "users.json")
    
    var body: some View {
        NavigationStack {
            FilteringList(users, filterKeys: \.name, \.address) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.address)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Address Book")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
