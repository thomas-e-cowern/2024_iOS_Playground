//
//  LoginView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/11/24.
//

import SwiftUI

struct LoginView: View {
    
    let title: String
    
    @Environment(Coordinator<LoginCoordinatorPages>.self) private var loginCoordinator
    
    @Environment(Coordinator<CoordinatorPages>.self) private var coordinator
    
    var body: some View {
        List {
            Button("Forgot Password") {
                loginCoordinator.push(.forgotPassword)
            }
            .padding(10)
            Button("Pop") {
                coordinator.pop(.sheet)
            }
            .padding(10)
            
        }
        .navigationTitle(title)
    }
}
