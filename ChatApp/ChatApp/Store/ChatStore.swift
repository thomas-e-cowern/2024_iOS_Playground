//
//  ChatStore.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/20/24.
//

import Foundation
import Observation

@Observable
class ChatStore {
    
    let httpClient: HTTPClient
    private(set) var messages: [Message] = []
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadMessages() {
        httpClient.load(messages: .init())
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { self.messages = $0 })
    }
}
