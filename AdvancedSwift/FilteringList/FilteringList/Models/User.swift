//
//  User.swift
//  FilteringList
//
//  Created by Thomas Cowern on 1/6/24.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: UUID
    let name: String
    let company: String
    let email: String
    let phone: String
    let address: String
}
