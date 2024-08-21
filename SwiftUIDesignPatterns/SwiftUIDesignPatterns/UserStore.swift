//
//  UserStore.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/20/24.
//

import Foundation
import SwiftUI

@Observable
class UserStore {
    let httpClient: HTTPClient
    
    var users: [User] = []
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func addUser(_ user: User) {
        users.append(user)
    }
    
    func loadUsers() async {
        do {
            users = try await httpClient.fetchUsers()
        } catch {
            print("Error getting users: \(error.localizedDescription)")
        }
    }
}
