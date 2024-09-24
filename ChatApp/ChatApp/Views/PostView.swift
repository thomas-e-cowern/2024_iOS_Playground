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
    var userId: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavigationLink {
                    CommentView(postId: post.id)
                } label: {
                    VStack(alignment: .leading) {
                        Text(chatStore.user?.username ?? "No User Found")
                            .frame(width: 300, height: 32)
                            .background(.yellow)
                        Text(post.title)
                            .font(.largeTitle)
                        Text(post.body)
                            .font(.headline)
                        
                    }
                }

            }
        }
        .task {
            do {
                try await chatStore.loadUserInfo(id: userId)
            } catch {
                print("Error in PostView: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    NavigationStack {
        PostView(post: Post(userId: 1, id: 1, title: "Sample Post", body: "Sample Post Body"), userId: 1)
    }
    .environment(ChatStore(httpClient: HTTPClient()))
}
