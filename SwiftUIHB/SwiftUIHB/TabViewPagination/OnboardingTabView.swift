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
            RoundedRectangle(cornerRadius: 30).padding()
            RoundedRectangle(cornerRadius: 30).padding()
            RoundedRectangle(cornerRadius: 30).padding()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

#Preview {
    OnboardingTabView()
}
