//
//  UserListScreen.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/10/24.
//

import SwiftUI

struct UserListScreen: View {
    
    @Environment(UserStore.self) private var userStore
//    let httpClient = HTTPClient()
//    @State private var users: [User] = []
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(userStore.users) { user in
                    VStack(alignment: .leading) {
                        Text("Name: \(user.name)")
                        Text("Age: \(user.age)")
                        Text("Email: \(user.email)")
                    }
                }
                .task {
                    await userStore.loadUsers()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add New User") {
                            isPresented = true
                        }
                    }
                })
                .sheet(isPresented: $isPresented, content: {
                    AddUserScreen()
                })
            }
            .padding()
        }
    }
    
//    private func loadUsers() async {
//        do {
//            users = try await httpClient.fetchUsers()
//        } catch {
//            print("Error getting users: \(error.localizedDescription)")
//        }
//    }
    
    // When using a function to update
    // private func addUser(_ user: User) {
    //    users.append(user)
    // }
}

#Preview {
    UserListScreen()
        .environment(UserStore(httpClient: HTTPClient()))
}
