//
//  Models.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/17/24.
//

import Foundation

// MARK: - User
struct User: Codable, Equatable, Hashable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
}

// MARK: - Support
struct Support: Codable, Equatable {
    let url: String
    let text: String
}
