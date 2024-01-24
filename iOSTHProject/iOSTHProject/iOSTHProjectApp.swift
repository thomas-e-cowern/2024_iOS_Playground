//
//  iOSTHProjectApp.swift
//  iOSTHProject
//
//  Created by Thomas Cowern on 1/16/24.
//

import SwiftUI

@main
struct iOSTHProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                    }
                SettingsView()
                    .tabItem {
                        Symbols.gear
                        Text("Settings")
                    }
            }
        }
    }
}
