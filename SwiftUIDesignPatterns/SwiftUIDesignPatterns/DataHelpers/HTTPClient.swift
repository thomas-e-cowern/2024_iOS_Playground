//
//  HTTPClient.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/21/24.
//

import Foundation

struct HTTPClient {
    func fetchUsers() async throws  -> [User] {
        try! await Task.sleep(for: .seconds(3.0))
        return [
            User(name: "Bob Smith", age: 47, email: "bsmith@job.com"),
            User(name: "Bill Jone", age: 57, email: "bjones@job.com"),
            User(name: "Lisa Doe", age: 35, email: "ldoe@job.com")
        ]
    }
}
