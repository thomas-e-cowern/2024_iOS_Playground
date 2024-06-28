//
//  ChatViewModel.swift
//  ChatGPTTestApp
//
//  Created by Thomas Cowern on 6/28/24.
//

import Foundation

extension ChatView {
    class ViewModel: ObservableObject {
        @Published var messages: [Message] = []
        
        func sendMessage() {
            
        }
    }
}

struct Message: Decodable {
    let id: UUID
    let content: String
    let createdAt: Date
}
