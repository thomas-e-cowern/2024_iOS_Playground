//
//  IntroViewOne.swift
//  SwiftUIHB
//
//  Created by Thomas Cowern on 2/26/24.
//

import SwiftUI

struct IntroViewOne: View {
    
    private var isShown = UserDefaults.standard.onboardingViewShown
    
    var body: some View {
        VStack {
            Text("This is the first intro view")
                .foregroundStyle(.white)
                .font(.title)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    IntroViewOne()
}
