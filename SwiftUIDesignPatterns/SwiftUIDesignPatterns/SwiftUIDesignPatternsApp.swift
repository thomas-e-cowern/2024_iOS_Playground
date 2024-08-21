//
//  SwiftUIDesignPatternsApp.swift
//  SwiftUIDesignPatterns
//
//  Created by Thomas Cowern on 8/10/24.
//

import SwiftUI

@main
struct SwiftUIDesignPatternsApp: App {
    
    let userStore = UserStore(httpClient: HTTPClient())
    
    var body: some Scene {
        WindowGroup {
            UserListScreen()
                .environmentObject(userStore)
        }
    }
}
