//
//  MainView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/13/24.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @Binding var language: String
    @Binding var layoutDirectionString: String
    
    var isPortraitPhone: Bool {
        horizontalSizeClass == .compact && verticalSizeClass == .regular
    }
    
    var isiPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    
    var body: some View {
        // Portrait mode
        if isPortraitPhone || isiPad {
            NavigationStack {
                ContentView()
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            LanguageOptionsView(language: $language, layoutDirectionString: $layoutDirectionString)
                        }
                    }
            }
        } else {
            // Landscape mode
            NavigationStack {
                LandscapeContentView()
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            LanguageOptionsView(language: $language, layoutDirectionString: $layoutDirectionString)
                        }
                    }
            }
        }
    }
}

#Preview {
    MainView(language: .constant("en"), layoutDirectionString: .constant(LEFT_TO_RIGHT))
}
