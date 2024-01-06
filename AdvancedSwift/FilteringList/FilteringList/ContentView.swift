//
//  ContentView.swift
//  FilteringList
//
//  Created by Thomas Cowern on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    
    let users = Bundle.main.decode([User].self, from: "users.json")
    @State private var filteredItems = [User]()
    @State private var filteredString = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type to filter", text: $filteredString.onChange(applyFilter))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                List(filteredItems) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.address)
                            .foregroundStyle(.secondary)
                    }
                }
                .onAppear(perform: applyFilter)
            }
            .navigationTitle("Address Book")
            .padding()
        }
    }
    
    func applyFilter() {
        let cleanedFilter = filteredString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanedFilter.isEmpty {
            filteredItems = users
        } else {
            filteredItems = users.filter { $0.name.localizedCaseInsensitiveContains(cleanedFilter) }
        }
    }
}

#Preview {
    ContentView()
}
