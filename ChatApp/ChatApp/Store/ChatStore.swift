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
    
    func loadMessages() async throws {
        print("inside load message")
        let resource = Resource(url: Constants.Urls.posts, modelType: [Message].self)
        messages = try await httpClient.load(resource)
    }
}
