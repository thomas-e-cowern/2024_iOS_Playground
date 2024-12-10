//
//  RebDeveloperApp.swift
//  RebDeveloper
//
//  Created by Thomas Cowern on 12/9/24.
//

import SwiftUI

@main
struct RebDeveloperApp: App {
    
    @State private var appService: AppService = AppService()
    
    var body: some Scene {
        WindowGroup {
            MSContentView()
                .environment(appService)
        }
    }
}
