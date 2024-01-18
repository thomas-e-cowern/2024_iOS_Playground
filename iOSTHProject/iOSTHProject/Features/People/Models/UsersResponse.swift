//
//  UsersResponse.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/17/24.
//

import Foundation

// MARK: - UsersResponse
struct UsersResponse: Codable, Equatable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
