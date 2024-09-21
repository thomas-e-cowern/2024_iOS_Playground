//
//  UserDetailView.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/21/24.
//

import SwiftUI

struct UserDetailView: View {
    
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                Text(" \(user.username)")
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                Text("\(user.name)")
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Email")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                Text("\(user.email)")
            }
        }
        .padding()
    }
}

#Preview {
    UserDetailView(user: User(id: 1, name: "Test User", username: "testuser", email: "testuser@example.com"))
}
