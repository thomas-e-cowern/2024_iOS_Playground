//
//  User.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/21/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
