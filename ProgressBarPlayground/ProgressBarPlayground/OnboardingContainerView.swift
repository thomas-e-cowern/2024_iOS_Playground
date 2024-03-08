//
//  OnboardingContainerView.swift
//  ProgressBarPlayground
//
//  Created by Thomas Cowern on 3/7/24.
//

import SwiftUI

struct OnboardingContainerView: View {
    var body: some View {
        VStack {
            
            TabView {
                ForEach(features) { feature in
                    OnboardingContentView(feature: feature)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

#Preview {
    OnboardingContainerView()
}
