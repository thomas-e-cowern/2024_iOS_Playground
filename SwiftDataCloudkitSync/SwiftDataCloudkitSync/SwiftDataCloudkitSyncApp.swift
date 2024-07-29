//
//  SwiftDataCloudkitSyncApp.swift
//  SwiftDataCloudkitSync
//
//  Created by Thomas Cowern on 7/24/24.
//

import SwiftUI

@main
struct SwiftDataCloudkitSyncApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Vegetable.self])
    }
}
