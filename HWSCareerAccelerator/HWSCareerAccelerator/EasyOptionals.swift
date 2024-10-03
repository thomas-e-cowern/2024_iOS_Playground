//
//  EasyOptionals.swift
//  HWSCareerAccelerator
//
//  Created by Thomas Cowern on 9/30/24.
//

import SwiftUI

struct User {
    var name: String
}

enum UserError: Error {
    case notTaylor
}

struct EasyOptionals: View {
    
    let users = [
        User(name: "Jack"),
        nil,
        User(name: "Gary"),
        nil,
        User(name: "Quinn")
    ]
    
    var body: some View {
        Button("Map usernames") {
//            mapUserNames()
            _ = try? getUsername(for: 24601)
        }
    }
    
    func mapUserNames() {
//        let usernames = users.compactMap(\.?.name)
//        print(usernames)
        
        
        for case let user? in users {
            print(user.name)
        }
    }
    
    func getUsername(for id: Int) throws -> String {
        if id == 1989 {
            "tswift"
        } else {
            print("Not Taylor")
            throw UserError.notTaylor
        }
    }
}

#Preview {
    EasyOptionals()
}
