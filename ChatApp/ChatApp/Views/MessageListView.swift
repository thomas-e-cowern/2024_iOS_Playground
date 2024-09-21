//
//  MessageListView.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/19/24.
//

import SwiftUI

struct MessageListView: View {
    
    @Environment(ChatStore.self) private var chatStore
    
    var body: some View {
        VStack {
            List(chatStore.messages) { message in
                PostView(post: message, userId: message.userId)
            }
        }
        .task {
            do {
                try await chatStore.loadMessages()
            } catch {
                print("Error fetching messages: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    NavigationStack {
        MessageListView()
    }
    .environment(ChatStore(httpClient: HTTPClient()))
}
