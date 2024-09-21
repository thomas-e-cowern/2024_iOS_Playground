//
//  PostView.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/21/24.
//

import SwiftUI

struct PostView: View {
    
    @Environment(ChatStore.self) private var chatStore
    
    var post: Post
    var user: User?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user?.username ?? "")
            Text(post.title)
                .font(.largeTitle)
            Text(post.body)
                .font(.headline)
        }
        .task {
            do {
                try await chatStore.loadUsers(id: post.userId)
            } catch {
                print("Problem loading users in PostView")
            }
        }
    }
}

#Preview {
    NavigationStack {
        PostView(post: Post(userId: 1, id: 1, title: "Sample Post", body: "Sample Post Body"), user: User(id: 1, name: "Sue Smith", username: "SSmith", email: "ssmith@yahoo.com"))
    }
    .environment(ChatStore(httpClient: HTTPClient()))
}
