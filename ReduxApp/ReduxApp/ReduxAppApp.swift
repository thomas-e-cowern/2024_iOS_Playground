//
//  ReduxAppApp.swift
//  ReduxApp
//
//  Created by Thomas Cowern on 4/10/24.
//

import SwiftUI

@main
struct ReduxAppApp: App {
    var body: some Scene {
        
        let store = Store(reducer: reducer)
        
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
