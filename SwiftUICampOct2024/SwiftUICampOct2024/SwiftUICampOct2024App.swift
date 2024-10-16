//
//  SwiftUICampOct2024App.swift
//  SwiftUICampOct2024
//
//  Created by Thomas Cowern on 10/16/24.
//

import SwiftUI

@main
struct SwiftUICampOct2024App: App {
    
    @State private var appController = AppController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appController)
        }
    }
}
