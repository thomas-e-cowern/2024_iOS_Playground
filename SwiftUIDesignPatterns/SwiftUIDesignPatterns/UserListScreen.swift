//
//  UserListScreen.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/10/24.
//

import SwiftUI

struct UserListScreen: View {
    
    
    let httpClient = HTTPClient()
    @State private var users: [User] = []
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(users) { user in
                    VStack(alignment: .leading) {
                        Text("Name: \(user.name)")
                        Text("Age: \(user.age)")
                        Text("Email: \(user.email)")
                    }
                }
                .task {
                    await loadUsers()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add New User") {
                            isPresented = true
                        }
                    }
                })
                .sheet(isPresented: $isPresented, content: {
                    AddUserScreen(users: $users)
                })
            }
            .padding()
        }
    }
    
    private func loadUsers() async {
        do {
            users = try await httpClient.fetchUsers()
        } catch {
            print("Error getting users: \(error.localizedDescription)")
        }
    }
    
    // When using a function to update
    // private func addUser(_ user: User) {
    //    users.append(user)
    // }
}

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

#Preview {
    UserListScreen()
}
