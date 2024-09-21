//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Thomas Cowern on 9/19/24.
//

import SwiftUI

@main
struct ChatAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(ChatStore(httpClient: HTTPClient()))
    }
}
