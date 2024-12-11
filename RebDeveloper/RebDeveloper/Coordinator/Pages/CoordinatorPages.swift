//
//  CoordinatorPages.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/11/24.
//

import SwiftUI

enum CoordinatorPages: Coordinatable {
    
    var id: UUID { .init() }
    
    case root
    case login(title: String)
    case signUp
    
    var body: some View {
        switch self {
        case .root:
            MainView()
        case .login(let title):
            Text("Login: \(title)")
        case .signUp:
            SignUpView()
        }
    }
}

enum LoginCoordinatorPages: Coordinatable {
    var id: UUID { .init() }
    
    case root(title: String)
    case forgotPassword
    
    var body: some View {
        switch self {
        case .root(title: let title):
            Text("Login: \(title)")
        case .forgotPassword:
            ForgotPasswordView()
        }
    }
}
