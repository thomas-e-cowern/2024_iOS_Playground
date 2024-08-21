//
//  AddUserScreen.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/10/24.
//

import SwiftUI

struct AddUserScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(UserStore.self) private var userStore
    
    @State private var name: String = ""
    @State private var age: Int = 18
    @State private var email: String = ""
    // Can also be done using a binding
//    @Binding var users: [User]
    
    // One way to do it using a callback function
    // let addUser: (User) -> Void
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Age", value: $age, format: .number)
            TextField("Email", text: $email)
            Button("Save new user") {
                let user = User(name: name, age: age, email: email)
                userStore.users.append(user)
                dismiss()
            }
        }
    }
}

#Preview {
    return AddUserScreen()
}
