//
//  ContentView.swift
//  SwiftUIHB
//
//  Created by Thomas Cowern on 2/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hasSeenIntro: Bool = UserDefaults.standard.onboardingViewShown
    
    var body: some View {
        VStack {
            if hasSeenIntro {
                HomeView()
            } else {
                OnboardingTabView()
            }
        }
        .padding()
        .onAppear {
            print("onboardingViewShown: \(UserDefaults.standard.onboardingViewShown)")
        }
    }
}

#Preview {
    ContentView()
}
