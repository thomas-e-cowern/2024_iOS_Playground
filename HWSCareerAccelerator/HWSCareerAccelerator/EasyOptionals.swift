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
            mapUserNames()
        }
    }
    
    func mapUserNames() {
//        let usernames = users.compactMap(\.?.name)
//        print(usernames)
        
        
        for case let user? in users {
            print(user.name)
        }
    }
}

#Preview {
    EasyOptionals()
}
