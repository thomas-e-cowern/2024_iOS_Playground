//
//  GreetingsMacApp.swift
//  GreetingsMac
//
//  Created by Thomas Cowern on 4/15/24.
//

import SwiftUI
import TipKit

@main
struct GreetingsMacApp: App {
    @AppStorage("language") var language: String = "en"
    @AppStorage("languageDirectionsString") var languageDirectionString: String = LEFT_TO_RIGHT
    
    var layoutDirection: LayoutDirection {
        languageDirectionString == LEFT_TO_RIGHT ? .leftToRight : .rightToLeft
    }
    
    let resetTip: Bool = false
    
    var body: some Scene {
        WindowGroup {
            MainView(language: $language, layoutDirectionString: $languageDirectionString)
                .environment(\.locale, Locale(identifier: language))
                .environment(\.layoutDirection, layoutDirection)
                .task {
                    /// use for testing.
                    if resetTip {
                        try? Tips.resetDatastore()
                    }
                   
                    
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
