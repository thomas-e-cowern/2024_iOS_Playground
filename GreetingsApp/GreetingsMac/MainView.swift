//
//  MainView.swift
//  GreetingsMac
//
//  Created by Thomas Cowern on 4/15/24.
//

//
//  MainView.swift
//  GreetingsApp
//
//  Created by Thomas Cowern on 4/13/24.
//

import SwiftUI

struct MainView: View {
    
    @Binding var language: String
    @Binding var layoutDirectionString: String
    
    var body: some View {
        // Portrait mode
        NavigationStack {
            LandscapeContentView()
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        LanguageOptionsView(language: $language, layoutDirectionString: $layoutDirectionString)
                    }
                }
        }
    }
}

#Preview {
    MainView(language: .constant("en"), layoutDirectionString: .constant(LEFT_TO_RIGHT))
}

