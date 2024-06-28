//
//  ChatViewModel.swift
//  TestUDOApp
//
//  Created by Thomas Cowern on 6/27/24.
//
import Foundation
import Combine
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messages: [String] = []
    @Published var inputMessage: String = ""
    
    private let chatGPTService = ChatGPTService()
    
    func sendMessage() {
        let userMessage = inputMessage
        messages.append("You: \(userMessage)")
        inputMessage = ""
        
        chatGPTService.sendMessage(userMessage) { [weak self] response in
            DispatchQueue.main.async {
                if let response = response {
                    self?.messages.append("ChatGPT: \(response)")
                } else {
                    self?.messages.append("Failed to get response from ChatGPT")
                }
            }
        }
    }
}
