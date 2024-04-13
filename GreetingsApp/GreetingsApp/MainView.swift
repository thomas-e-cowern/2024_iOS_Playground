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
    
    var body: some View {
        // Portrait mode
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            ContentView()
        } else {
            // Landscape mode
            LandscapeContentView()
        }
    }
}

#Preview {
    MainView()
}
