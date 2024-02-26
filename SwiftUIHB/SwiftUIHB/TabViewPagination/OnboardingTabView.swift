//
//  OnboardingTabView.swift
//  SwiftUIHB
//
//  Created by Thomas Cowern on 2/26/24.
//

import SwiftUI

struct OnboardingTabView: View {
    var body: some View {
        TabView {
            IntroViewOne()
                .padding()
            IntroViewTwo()
                .padding()
            IntroViewThree()
                .padding()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

#Preview {
    OnboardingTabView()
}
