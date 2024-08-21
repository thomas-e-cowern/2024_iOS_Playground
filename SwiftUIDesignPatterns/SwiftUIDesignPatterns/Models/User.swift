//
//  User.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/10/24.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let email: String
}
