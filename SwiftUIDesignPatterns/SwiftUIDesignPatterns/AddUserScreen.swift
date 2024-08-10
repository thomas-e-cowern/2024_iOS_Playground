//
//  AddUserScreen.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/10/24.
//

import SwiftUI

struct AddUserScreen: View {
    
    @State private var name: String = ""
    @State private var age: Int = 18
    @State private var email: String = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Age", value: $age, format: .number)
            TextField("Email", text: $email)
            Button("Save new user") {
                let user = User(name: name, age: age, email: email)
            }
        }
    }
}

#Preview {
    AddUserScreen()
}
