//
//  UserListView.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/21/24.
//

import SwiftUI

struct UserListView: View {
    
    @Environment(ChatStore.self) private var chatStore
    
    var body: some View {
        VStack {
            List(chatStore.users) { user in
                UserDetailView(user: user)
                    .border(.black)
            }
        }
        .task {
            do {
                try await chatStore.loadUsers()
            } catch {
                print("Error fetching messages: \(error.localizedDescription)")
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    NavigationStack {
        UserListView()
    }
    .environment(ChatStore(httpClient: HTTPClient()))
}