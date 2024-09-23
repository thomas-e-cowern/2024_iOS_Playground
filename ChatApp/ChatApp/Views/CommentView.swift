//
//  CommentView.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/23/24.
//

import SwiftUI

struct CommentView: View {
    
    @Environment(ChatStore.self) private var chatStore
    var postId: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(chatStore.comments) { comment in
                    HStack {
                        Text("\(comment.postId)")
                        Text("Email -")
                        Text(comment.email)
                    }
                    
                    HStack {
                        Text("Title -")
                        Text(comment.name)
                    }
                    .font(.headline)
                    
                    HStack {
                        Text(comment.body)
                    }
                    .background(Color.gray.opacity(0.2))
                    
                    Divider()
                    
                }
                
            }
            .padding()
            .task {
                do {
                    try await chatStore.loadComments(postId: postId)
                } catch {
                    print("Error in CommentView: \(error.localizedDescription)")
                }
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        CommentView(postId: 2)
    }
    .environment(ChatStore(httpClient: HTTPClient()))
}
