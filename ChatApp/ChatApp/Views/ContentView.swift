//
//  ContentView.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ChatStore.self) private var chatStore
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    MessageListView()
                        .tabItem {
                            Label("Posts", systemImage: "list.dash")
                        }
                    
                    UserListView()
                        .tabItem {
                            Label("Users", systemImage: "person.crop.circle")
                        }
                }
            }
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("New Chat") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
    .environment(ChatStore(httpClient: HTTPClient()))
}
