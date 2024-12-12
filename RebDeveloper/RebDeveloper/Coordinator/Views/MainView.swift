//
//  MainView.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/11/24.
//

import SwiftUI

struct MainView: View {
    
    @Environment(Coordinator<CoordinatorPages>.self) private var mainCoordinator
    
    var body: some View {
        List {
            Button("Sign Up") {
                mainCoordinator.push(.signUp)
            }
            .padding(10)
            Button("Login") {
                mainCoordinator.push(.login(title: "Please log in..."), type: .sheet)
            }
            .padding(10)
            
        }
    }
}

#Preview {
    MainView()
}
