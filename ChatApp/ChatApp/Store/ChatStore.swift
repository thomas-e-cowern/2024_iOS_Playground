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
    private(set) var messages: [Post] = []
    private(set) var users: [User] = []
    private(set) var user: User?
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadMessages() async throws {
        let resource = Resource(url: Constants.Urls.posts, modelType: [Post].self)
        messages = try await httpClient.load(resource)
    }
    
    func loadUsers() async throws {
        let resource = Resource(url: Constants.Urls.users, modelType: [User].self)
        users = try await httpClient.load(resource)
    }
    
    func loadUserInfo(id: Int) async throws {
        let resource = Resource(url: Constants.Urls.getUserInfo(id: id), modelType: User.self)
        user = try await httpClient.load(resource)
    }
}
