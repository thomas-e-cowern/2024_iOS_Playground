//
//  OpenAIService.swift
//  ChatGPTTestApp
//
//  Created by Thomas Cowern on 6/28/24.
//

import Foundation
import Alamofire

class OpenAIService {
    
    private let endpointUrl = "https://api.openai.com/v1/chat/completions"
    
    func sendMessage () {
        
    }
}

struct OpenAIChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Encodable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Encodable {
    case system
    case user
    case assistant
}
