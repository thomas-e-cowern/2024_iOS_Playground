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
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
}
