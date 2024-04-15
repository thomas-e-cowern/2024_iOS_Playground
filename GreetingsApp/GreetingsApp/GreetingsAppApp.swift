//
//  GreetingsAppApp.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/10/24.
//

import SwiftUI
import TipKit

@main
struct GreetingsAppApp: App {
    
//    @State private var language: String = "en"
//    @State private var languageDirectionString: String = LEFT_TO_RIGHT
    @AppStorage("language") var language: String = "en"
    @AppStorage("languageDirectionsString") var languageDirectionString: String = LEFT_TO_RIGHT
    
    var layoutDirection: LayoutDirection {
        languageDirectionString == LEFT_TO_RIGHT ? .leftToRight : .rightToLeft
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(language: $language, layoutDirectionString: $languageDirectionString)
                .environment(\.locale, Locale(identifier: language))
                .environment(\.layoutDirection, layoutDirection)
                .task {
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
