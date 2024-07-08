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
        @Published var currentInput: String = ""
        
        private let openAIService = OpenAIService()
        func sendMessage() {
            let newMessage = Message(id: UUID(), role: .user, content: currentInput, createdAt: Date())
            messages.append(newMessage)
            currentInput = ""
            print(messages)
            Task {
                let response = await openAIService.sendMessage(messages: messages)
                print(response ?? "No response")
                guard let recievedOpenAIMessage = response?.choices.first?.messages else {
                    print("Had no recieved message")
                    return
                }
                let recievedMessage = Message(id: UUID(), role: recievedOpenAIMessage.role, content: recievedOpenAIMessage.content, createdAt: Date())
                
                await MainActor.run {
                    messages.append(recievedMessage)
                }
            }
        }
    }
}

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
    let createdAt: Date
}
