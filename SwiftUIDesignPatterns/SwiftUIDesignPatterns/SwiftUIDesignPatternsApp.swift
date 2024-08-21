//
//  SwiftUIDesignPatternsApp.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/10/24.
//

import SwiftUI

@main
struct SwiftUIDesignPatternsApp: App {
    
    @Environment(UserStore.self) private var userStore
    
    var body: some Scene {
        WindowGroup {
            UserListScreen()
                .environmentObject(UserStore(httpClient: HTTPClient()))
        }
    }
}
