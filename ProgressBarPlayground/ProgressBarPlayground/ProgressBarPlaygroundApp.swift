//
//  ProgressBarPlaygroundApp.swift
//  ProgressBarPlayground
//
//  Created by Thomas Cowern on 3/7/24.
//

import SwiftUI

@main
struct ProgressBarPlaygroundApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingContainerView()
            } else {
                ContentView()
            }
        }
    }
}
