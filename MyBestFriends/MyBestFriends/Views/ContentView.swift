//
//  ContentView.swift
//  MyBestFriends
//
//  Created by Thomas Cowern on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0...19, id: \.self) { item in
                    
                    NavigationLink {
                        ContactDetailView()
                    } label: {
                        ContactRowView()
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
}
        
#Preview {
    ContentView()
}
