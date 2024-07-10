//
//  iTourApp.swift
//  iTour
//
//  Created by Thomas Cowern on 7/10/24.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
